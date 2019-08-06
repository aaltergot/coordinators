import UIKit

protocol ProfileTabView: class {
    func openProfile(out: @escaping ProfileOut) -> ProfileIn
}

protocol ProfileTabViewOut: class {
    func viewDidLoad()
}

class ProfileTabNavigationController: UINavigationController {

    var presenter: (ProfileTabIn & ProfileTabViewOut)!

    init(out: @escaping ProfileTabOut) {
        super.init(nibName: nil, bundle: nil)
        self.setupView()
        self.presenter = ProfileTabPresenter(view: self, out: out)
        self.presenter.viewDidLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "Profile"
    }
}

extension ProfileTabNavigationController: ProfileTabView {

    func openProfile(out: @escaping ProfileOut) -> ProfileIn {
        let vc = ProfileViewController(out: out)
        self.setViewControllers([vc], animated: false)
        return vc.presenter
    }
}
