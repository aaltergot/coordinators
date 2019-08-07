import UIKit

protocol ProfileView: class {
}

protocol ProfileViewOut: class {
    func viewDidLoad()
}

class ProfileViewController: UIViewController, ProfileView {
    
    var presenter: (ProfileViewOut & ProfileIn)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    private func setupView() {
        self.title = "Profile"
    }

    @IBAction func settingsButtonPressed() {
        self.presenter.openSettings()
    }
}

extension ProfileViewController {

    convenience init(nc: UINavigationController, out: @escaping ProfileOut) {
        self.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        self.presenter = ProfilePresenter(
            view: self,
            coordinator: NavigationProfileCoordinator(nc),
            out: out
        )
    }
}

