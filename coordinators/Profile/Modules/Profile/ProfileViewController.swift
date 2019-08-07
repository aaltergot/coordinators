import UIKit

protocol ProfileView: class {
}

protocol ProfileViewOut: class {
    func viewDidLoad()
    func openSettings()
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

    convenience init(out: @escaping ProfileOut) {
        self.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        self.presenter = ProfilePresenter(view: self, out: out)
    }
}

