import UIKit

protocol ProfileTabCoordinator: class {
    func openProfile(out: @escaping ProfileOut) -> ProfileIn
}

class NavigationProfileTabCoordinator: ProfileTabCoordinator {

    private unowned let nc: UINavigationController

    init(_ nc: UINavigationController) {
        self.nc = nc
    }

    func openProfile(out: @escaping ProfileOut) -> ProfileIn {
        let vc = ProfileViewController(nc: self.nc, out: out)
        self.nc.setViewControllers([vc], animated: false)
        return vc.presenter
    }
}
