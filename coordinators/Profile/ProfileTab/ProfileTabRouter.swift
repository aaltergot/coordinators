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

    func openProfile(_ out: @escaping ProfileOut) {
        guard let nc = self.navigationController else { return }
        nc.setViewControllers([self.assembly.profileAssembly.createModule(out)], animated: false)
    }

    func openSettings(_ out: @escaping SettingsOut) {
        guard let nc = self.navigationController else { return }
        nc.pushViewController(self.assembly.settingsAssembly.createModule(out), animated: true)
    }
}
