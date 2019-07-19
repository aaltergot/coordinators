class ProfileTabPresenter: ProfileTabIn, ProfileTabViewOut {

    private weak var viewIn: ProfileTabViewIn?
    private let router: ProfileTabRouter

    private let inOut: ProfileTabInOut
    private weak var out: ProfileTabOut?

    private weak var settingsIn: SettingsIn?

    init(
        viewIn: ProfileTabViewIn?,
        router: ProfileTabRouter,
        inOut: @escaping ProfileTabInOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.inOut = inOut
    }

    func viewCreated() {
        self.out = self.inOut(self)
        self.router.openProfile { [weak self] _ in return self }
    }

    func handle(_ command: ProfileTabInCommand) {
        switch command {
        case let .processDeepLink(deepLink):
            let split = deepLink.split(separator: "/")
            if split.first == "settings" {
                if settingsIn == nil {
                    self.openSettings()
                }
            }
        }
    }

    private func openSettings() {
        self.router.openSettings { [weak self] settingsIn in
            self?.settingsIn = settingsIn
            return self
        }
    }
}

extension ProfileTabPresenter: ProfileOut {
    func profileOpenSettings() {
        self.openSettings()
    }
}

extension ProfileTabPresenter: SettingsOut {
}

