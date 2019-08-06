protocol RootIn: class {
    func processDeepLink(_ deepLink: String)
}

enum RootOutCmd {
}

typealias RootOut = (RootOutCmd) -> Void

class RootPresenter: RootIn, RootViewOut {

    private weak var view: RootView?
    private let loginService: LoginService
    private let out: RootOut

    private var mainTabBarIn: MainTabBarIn?
    private var loginIn: LoginIn?

    private var deferredDeepLink: String? = nil

    init(
        view: RootView?,
        loginService: LoginService,
        out: @escaping RootOut
    ) {
        self.view = view
        self.loginService = loginService
        self.out = out
    }

    func viewDidLoad() {
        self.loginService.addDelegate(delegate: self)
        if (self.loginService.isLoggedIn()) {
            self.openTabBar()
        } else {
            self.openLogin()
        }
    }

    func processDeepLink(_ deepLink: String) {
        guard let mainTabBarIn = self.mainTabBarIn else {
            self.deferredDeepLink = deepLink
            return
        }
        mainTabBarIn.processDeepLink(deepLink)
    }

    private func processDeferredDeepLink() {
        guard let deepLink = self.deferredDeepLink else { return }
        self.deferredDeepLink = nil
        self.processDeepLink(deepLink)
    }

    private func openTabBar() {
        if self.mainTabBarIn == nil {
            self.mainTabBarIn = self.view?.openMainTabBar { _ in self.processDeferredDeepLink() }
        }
    }

    private func openLogin() {
        if self.loginIn == nil {
            self.loginIn = self.view?.openLogin { _ in }
        }
    }
}

extension RootPresenter: LoginDelegate {

    func didLogin() {
        self.openTabBar()
    }

    func didLogout() {
        self.openLogin()
    }
}
