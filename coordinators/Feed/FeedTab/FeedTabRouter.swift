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

    func openFeed(_ out: @escaping FeedOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.feedAssembly.createModule(out)], animated: false)
    }
}
