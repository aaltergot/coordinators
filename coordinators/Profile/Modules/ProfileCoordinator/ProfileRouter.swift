import UIKit

protocol ProfileRouter: AnyObject {
    func openProfile(out: @escaping ProfileOut) -> ProfileIn?
    func openSettings(out: @escaping SettingsOut) -> SettingsIn?
}

class ProfileRouterImpl: ProfileRouter {

    private weak var nc: UINavigationController?
    let push: Bool

    init(_ nc: UINavigationController?, push: Bool = false) {
        self.nc = nc
        self.push = push
    }

    func openSettings(out: @escaping SettingsOut) -> SettingsIn? {
        let vc = SettingsViewController { [weak self] cmd in
            switch cmd {
            case .done:
                self?.nc?.popViewController(animated: true)
            }
            out(cmd)
        }
        self.nc?.pushViewController(vc, animated: true)
        return vc.presenter
    }

    func openProfile(out: @escaping ProfileOut) -> ProfileIn? {
        let vc = ProfileViewController(out: out)
        if self.push {
            self.nc?.pushViewController(vc, animated: true)
        } else {
            self.nc?.setViewControllers([vc], animated: true)
        }
        return vc.presenter
    }
}
