import UIKit

class ProfileTabRouterImpl: ProfileTabRouter {

    private weak var navigationController: UINavigationController?

    private unowned let assembly: ProfileTabAssembly

    init(
        navigationController: UINavigationController?,
        assembly: ProfileTabAssembly
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    func openProfile(_ inOut: @escaping ProfileInOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.profileAssembly.createModule(nc, inOut)], animated: false)
    }
}
