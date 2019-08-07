import UIKit


// TODO remove
class ProfileTabNavigationController: UINavigationController {

    var view1: ProfileCoordinatorView!
    unowned var profileCoordinatorIn: ProfileCoordinatorIn!

    init(out: @escaping ProfileCoordinatorOut) {
        super.init(nibName: nil, bundle: nil)
        self.setupView()

        let view = ProfileCoordinatorViewImpl(self)
        let presenter = ProfileCoordinator(view: view, out: out)
        presenter.openProfile()
        view.presenter = presenter
        self.view1 = view
        self.profileCoordinatorIn = presenter
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "Profile"
    }
}


