enum ProfileCoordinatorOutCmd {
}

typealias ProfileCoordinatorOut = (ProfileCoordinatorOutCmd) -> Void

protocol ProfileCoordinatorIn: class {
    func processDeepLink(_ deepLink: String)
    func openProfile()
    func openSettings()
}

class ProfileCoordinator: ProfileCoordinatorIn {

    private var router: ProfileRouter
    private let out: ProfileCoordinatorOut

    private weak var settingsIn: SettingsIn?
    private weak var profileIn: ProfileIn?

    init(
        router: ProfileRouter,
        out: @escaping ProfileCoordinatorOut
    ) {
        self.router = router
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
            self.profileIn = self.router.openProfile { cmd in
                switch cmd {
                case .openSettings:
                    self.openSettings()
                }
            }
        }
    }

    func openSettings() {
        if self.settingsIn == nil {
            self.settingsIn = self.router.openSettings { _ in }
        }
    }
}

import UIKit

extension ProfileCoordinator {
    convenience init (
        _ nc: UINavigationController?,
        push: Bool = false,
        out: @escaping (ProfileCoordinatorOutCmd) -> Void) {
        self.init(
            router: ProfileRouterImpl(nc, push: push),
            out: out)
    }
}
