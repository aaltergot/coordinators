import UIKit

class RootRouterImpl: RootRouter {

    private weak var navigationController: UINavigationController?

    private unowned let assembly: RootAssembly

    init(
        navigationController: UINavigationController?,
        assembly: RootAssembly
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func openTabBar(
        feedTabInOut: @escaping FeedTabInOut,
        profileTabInOut: @escaping ProfileTabInOut,
        tabBarInOut: @escaping TabBarInOut
    ) {
        guard let nc = self.navigationController else { return }
        let tabBarView = self.assembly.tabBarAssembly.createModule(
            feedTabInOut: feedTabInOut,
            profileTabInOut: profileTabInOut,
            tabBarInOut: tabBarInOut
        )
        nc.setViewControllers([tabBarView], animated: true)
    }

    func openLogin(_ inOut: @escaping LoginInOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.loginAssembly.createModule(inOut)], animated: true)
    }
}
