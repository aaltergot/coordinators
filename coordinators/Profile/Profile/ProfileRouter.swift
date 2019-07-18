import UIKit

class ProfileRouterImpl: ProfileRouter {

    private weak var navigationController: UINavigationController?
    private unowned let assembly: ProfileAssembly

    init(
        navigationController: UINavigationController?,
        assembly: ProfileAssembly
    ) {
        self.navigationController = navigationController
        self.assembly = assembly
    }

    // Mark: - ProfileRouter

    func openSettings(_ inOut: @escaping SettingsInOut) {
        self.openSettings(animated: true, inOut)
    }

    // Mark: - Private

    private func withNavigationController(_ f: (UINavigationController) -> Void) {
        self.navigationController.map(f)
    }

    private func openSettings(animated: Bool, _ inOut: @escaping SettingsInOut) {
        self.withNavigationController {
            $0.pushViewController(
                self.assembly.settingsAssembly.createModule(inOut),
                animated: animated
            )
        }
    }
}
