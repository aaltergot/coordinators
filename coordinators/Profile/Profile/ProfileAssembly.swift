import UIKit

class ProfileAssembly {

    func createModule(_ out: @escaping ProfileOut) -> ProfileViewType {
        let view = ProfileView(
            nibName: String(describing: ProfileView.self),
            bundle: nil
        )
        let presenter = ProfilePresenter(viewIn: view, out: out)
        view.viewOut = presenter
        return view
    }
}
