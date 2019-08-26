protocol MainTabBarIn: class {
    func processDeepLink(_ deepLink: String)
}

enum MainTabBarOutCmd {
}

typealias MainTabBarOut = (MainTabBarOutCmd) -> Void

class MainTabBarPresenter: MainTabBarIn, MainTabBarViewOut {

    private weak var view: MainTabBarView?
    private let out: MainTabBarOut

    private weak var profileCoordinatorIn: ProfileCoordinatorIn?

    init(
        view: MainTabBarView?,
        out: @escaping MainTabBarOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
        self.view?.addFeedTab { _ in }
        self.profileCoordinatorIn = self.view?.addProfileTab { _ in }
        self.view?.showFeedTab()
    }

    func processDeepLink(_ deepLink: String) {
        let split = deepLink.split(separator: "/")
        if split.first == "profile" {
            self.view?.showProfileTab()
            let rest = split.dropFirst().joined(separator: "/")
            if !rest.isEmpty {
                profileCoordinatorIn?.processDeepLink(rest)
            }
        } else {
            self.view?.showFeedTab()
        }
    }
}
