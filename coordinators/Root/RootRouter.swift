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
        feedTabOut: @escaping FeedTabOut,
        profileTabOut: @escaping ProfileTabOut,
        tabBarOut: @escaping TabBarOut
    ) {
        guard let nc = self.navigationController else { return }
        let tabBarView = self.assembly.tabBarAssembly.createModule(
            feedTabOut: feedTabOut,
            profileTabOut: profileTabOut,
            tabBarOut: tabBarOut
        )
        nc.setViewControllers([tabBarView], animated: true)
    }

    func openLogin(_ out: @escaping LoginOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.loginAssembly.createModule(out)], animated: true)
    }
}
