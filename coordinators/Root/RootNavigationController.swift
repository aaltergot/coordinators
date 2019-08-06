import UIKit

internal protocol RootView: class {
    func openMainTabBar(out: @escaping MainTabBarOut) -> MainTabBarIn?
    func openLogin(out: @escaping LoginOut) -> LoginIn?
}

internal protocol RootViewOut: class {
    func viewDidLoad()
}

class RootNavigationController: UINavigationController {
    
    var presenter: (RootIn & RootViewOut)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    private func setupView() {
        self.setNavigationBarHidden(true, animated: false)
    }
}

extension RootNavigationController: RootView {

    func openMainTabBar(out: @escaping MainTabBarOut) -> MainTabBarIn? {
        let mainTabBarController = MainTabBarController(out: out)
        self.setViewControllers([mainTabBarController], animated: true)
        return mainTabBarController.presenter
    }

    func openLogin(out: @escaping LoginOut) -> LoginIn? {
        let loginViewController = LoginViewController(out: out)
        self.setViewControllers([loginViewController], animated: true)
        return loginViewController.presenter
    }
}

extension RootNavigationController {

    convenience init(
        loginService: LoginService = LoginServiceImpl.shared,
        out: @escaping RootOut
    ) {
        self.init()
        self.presenter = RootPresenter(view: self, loginService: loginService, out: out)
    }
}
