import UIKit

class ProfileTabAssembly {

    let profileAssembly: ProfileAssembly
    let settingsAssembly: SettingsAssembly

    init(
        profileAssembly: ProfileAssembly,
        settingsAssembly: SettingsAssembly
    ) {
        self.profileAssembly = profileAssembly
        self.settingsAssembly = settingsAssembly
    }

    func createModule(
        _ inOut: @escaping ProfileTabInOut
    ) -> ProfileTabViewType {
        let view = ProfileTabView { [weak self] view in
            guard let self = self else { return nil }
            let router = ProfileTabRouterImpl(navigationController: view, assembly: self)
            return ProfileTabPresenter(viewIn: view, router: router, inOut: inOut)
        }
        return view
    }

}
