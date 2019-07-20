class ProfileTabPresenter: ProfileTabViewOut {

    private weak var viewIn: ProfileTabViewIn?
    private let router: ProfileTabRouter

    private let out: ProfileTabOut

    private var settingsIn: SettingsIn?

    init(
        viewIn: ProfileTabViewIn?,
        router: ProfileTabRouter,
        out: @escaping ProfileTabOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.out = out
    }

    func viewCreated() {
        self.openProfile()
        self.out(.register(ModuleIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    private func invoke(_ cmd: ProfileTabInCmd) { switch cmd {
    case let .processDeepLink(deepLink):
        let split = deepLink.split(separator: "/")
        if split.first == "settings" {
            if !(self.settingsIn?.isAlive() ?? false) {
                self.openSettings()
            }
        }
    }}

    private func openProfile() {
        self.router.openProfile { [weak self] profileCmd in
            guard let self = self else { return }

            switch profileCmd {
            case .register(_):
                break

            case .openSettings:
                self.openSettings()

            case let .getData(callback):
                callback("hello")
            }
        }
    }

    private func openSettings() {
        self.router.openSettings { [weak self] settingsCmd in
            guard let self = self else { return }

            switch settingsCmd {
            case let .register(settingsIn):
                self.settingsIn = settingsIn
            }
        }
    }
}

