import UIKit

class ProfileAssembly {

    func createModule(_ inOut: @escaping ProfileInOut) -> ProfileViewType {
        let view = ProfileView(
            nibName: String(describing: ProfileView.self),
            bundle: nil
        )
        let presenter = ProfilePresenter(viewIn: view, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
