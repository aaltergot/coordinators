import UIKit

protocol ProfileCoordinatorView: class {
    func openProfile(out: @escaping ProfileOut) -> ProfileIn?
    func openSettings(out: @escaping SettingsOut) -> SettingsIn?
}

protocol ProfileCoordinatorViewOut: class {
}

class ProfileCoordinatorViewImpl: ProfileCoordinatorView {

    private unowned let nc: UINavigationController
    var presenter: (ProfileCoordinatorViewOut & ProfileCoordinatorIn)!
    let push: Bool

    init(_ nc: UINavigationController, push: Bool = false) {
        self.nc = nc
        self.push = push
    }

    func openSettings(out: @escaping SettingsOut) -> SettingsIn? {
        let vc = SettingsViewController { [weak self] cmd in
            switch cmd {
            case .done:
                self?.nc.popViewController(animated: true)
            default:
                break
            }
            out(cmd)
        }
        self.nc.pushViewController(vc, animated: true)
        return vc.presenter
    }

    func openProfile(out: @escaping ProfileOut) -> ProfileIn? {
        let vc = ProfileViewController(out: out)
        if self.push {
            self.nc.pushViewController(vc, animated: true)
        } else {
            self.nc.setViewControllers([vc], animated: true)
        }
        return vc.presenter
    }
}
