import UIKit

class FeedTabRouterImpl: FeedTabRouter {

    private weak var navigationController: UINavigationController?

    private unowned let assembly: FeedTabAssembly

    init(
        navigationController: UINavigationController?,
        assembly: FeedTabAssembly
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func openFeed(_ inOut: @escaping FeedInOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.feedAssembly.createModule(inOut)], animated: false)
    }
}
