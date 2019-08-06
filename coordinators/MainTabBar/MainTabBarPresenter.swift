protocol MainTabBarIn: class {
    func processDeepLink(_ deepLink: String)
}

enum MainTabBarOutCmd {
}

typealias MainTabBarOut = (MainTabBarOutCmd) -> Void

class MainTabBarPresenter: MainTabBarIn, MainTabBarViewOut {

    private weak var view: MainTabBarView?
    private let out: MainTabBarOut

    private weak var profileTabIn: ProfileTabIn?

    init(
        view: MainTabBarView?,
        out: @escaping MainTabBarOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
        self.view?.addFeedTab { _ in }
        self.profileTabIn = self.view?.addProfileTab { _ in }
        self.view?.showFeedTab()
    }

    func processDeepLink(_ deepLink: String) {
        let split = deepLink.split(separator: "/")
        if split.first == "profile" {
            self.view?.showProfileTab()
            let rest = split.dropFirst().joined(separator: "/")
            if !rest.isEmpty {
                profileTabIn?.processDeepLink(rest)
            }
        } else {
            self.view?.showFeedTab()
        }
    }
}
