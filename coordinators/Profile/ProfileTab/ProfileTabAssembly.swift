import UIKit

class ProfileTabAssembly {

    let profileAssembly: ProfileAssembly

    init(profileAssembly: ProfileAssembly) {
        self.profileAssembly = profileAssembly
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
