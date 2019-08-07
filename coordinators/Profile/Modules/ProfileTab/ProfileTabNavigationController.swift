import UIKit

protocol ProfileTabView: class {
}

protocol ProfileTabViewOut: class {
    func viewDidLoad()
}

class ProfileTabNavigationController: UINavigationController, ProfileTabView {

    var presenter: (ProfileTabIn & ProfileTabViewOut)!

    init(out: @escaping ProfileTabOut) {
        super.init(nibName: nil, bundle: nil)
        self.setupView()
        self.presenter = ProfileTabPresenter(
            view: self,
            coordinator: NavigationProfileTabCoordinator(self),
            out: out
        )
        self.presenter.viewDidLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "Profile"
    }
}
