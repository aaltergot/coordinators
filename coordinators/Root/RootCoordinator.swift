import UIKit

protocol RootCoordinator: class {
    func openMainTabBar(out: @escaping MainTabBarOut) -> MainTabBarIn?
    func openLogin(out: @escaping LoginOut) -> LoginIn?
}

class NavigationRootCoordinator: RootCoordinator {

    private unowned let nc: UINavigationController

    init(_ nc: UINavigationController) {
        self.nc = nc
    }

    func openMainTabBar(out: @escaping MainTabBarOut) -> MainTabBarIn? {
        let mainTabBarController = MainTabBarController(out: out)
        self.nc.setViewControllers([mainTabBarController], animated: true)
        return mainTabBarController.presenter
    }

    func openLogin(out: @escaping LoginOut) -> LoginIn? {
        let loginViewController = LoginViewController(out: out)
        self.nc.setViewControllers([loginViewController], animated: true)
        return loginViewController.presenter
    }
}
