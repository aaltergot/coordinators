import UIKit

class ProfileAssembly {

    let settingsAssembly: SettingsAssembly

    init(settingsAssembly: SettingsAssembly) {
        self.settingsAssembly = settingsAssembly
    }

    func createModule(
        _ nc: UINavigationController?,
        _ inOut: @escaping ProfileInOut
    ) -> ProfileViewType {
        let view = ProfileView(
            nibName: String(describing: ProfileView.self),
            bundle: nil
        )
        let router = ProfileRouterImpl(navigationController: nc, assembly: self)
        let presenter = ProfilePresenter(viewIn: view, router: router, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
