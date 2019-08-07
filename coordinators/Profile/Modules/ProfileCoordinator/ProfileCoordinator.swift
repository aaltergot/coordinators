enum ProfileCoordinatorOutCmd {
}

typealias ProfileCoordinatorOut = (ProfileCoordinatorOutCmd) -> Void

protocol ProfileCoordinatorIn: class {
    func processDeepLink(_ deepLink: String)
    func openProfile()
    func openSettings()
}

class ProfileCoordinator: ProfileCoordinatorIn, ProfileCoordinatorViewOut {

    private weak var view: ProfileCoordinatorView?
    private let out: ProfileCoordinatorOut

    private weak var settingsIn: SettingsIn?
    private weak var profileIn: ProfileIn?

    init(
        view: ProfileCoordinatorView?,
        out: @escaping ProfileCoordinatorOut
    ) {
        self.view = view
        self.out = out
    }

    func processDeepLink(_ deepLink: String) {
        let split = deepLink.split(separator: "/")
        if split.first == "settings" {
            self.openProfile()
            self.openSettings()
        }
    }

    func openProfile() {
        if self.profileIn == nil {
            self.profileIn = self.view?.openProfile { [weak self] cmd in
                switch cmd {
                case .openSettings:
                    self?.openSettings()
                }
            }
        }
    }

    func openSettings() {
        if self.settingsIn == nil {
            self.settingsIn = self.view?.openSettings { _ in }
        }
    }
}
