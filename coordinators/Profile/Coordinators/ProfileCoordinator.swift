import UIKit

protocol ProfileCoordinator: class {
    func openSettings(out: @escaping SettingsOut) -> SettingsIn?
}


class NavigationProfileCoordinator: ProfileCoordinator {

    private unowned let nc: UINavigationController

    init(_ nc: UINavigationController) {
        self.nc = nc
    }

    func openSettings(out: @escaping SettingsOut) -> SettingsIn? {
        let vc = SettingsViewController(out: out)
        self.nc.pushViewController(vc, animated: true)
        return vc.presenter
    }
}
