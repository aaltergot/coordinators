import Foundation
import UIKit

class RootCoordinator: FeedTabOut, ProfileTabOut, LoginOut {
    let assembly: RootAssembly
    let loginService: LoginService
    var navigationController: UINavigationController?
    
    init(assembly: RootAssembly, loginService: LoginService) {
        self.assembly = assembly
        self.loginService = loginService
    }
    
    func run(_ window: UIWindow) {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        window.rootViewController = navigationController
        if (self.loginService.isLoggedIn()) {
            self.showTabBar(navigationController)
        }
        else {
            self.showLogin(navigationController)
        }
        self.loginService.addDelegate(delegate: self)
    }
    
    open func showTabBar(_ navigationController: UINavigationController) {
        let feed = assembly.feedTabAssembly.createModule({ [weak self] _ in self })
        let profile = assembly.profileTabAssembly.createModule({ [weak self] _ in self })
        
        let tabController = UITabBarController()
        tabController.viewControllers = [feed, profile]
        navigationController.setViewControllers([tabController], animated: true)
    }
    
    open func showLogin(_ navigationController: UINavigationController) {
        let login = self.assembly.loginAssembly.createModule({ [weak self] _ in self})
        
        navigationController.setViewControllers([login], animated: true)
    }
}

extension RootCoordinator: LoginDelegate {

    func didLogin() {
        guard let navigationController = self.navigationController else { return }
        showTabBar(navigationController)
    }
    
    func didLogout() {
        guard let navigationController = self.navigationController else { return }
        showLogin(navigationController)
    }
}

