import UIKit

protocol ProfileView: class {
    func openSettings(out: @escaping SettingsOut) -> SettingsIn?
}

protocol ProfileViewOut: class {
    func viewDidLoad()
}

class ProfileViewController: UIViewController {
    
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

extension ProfileViewController: ProfileView {

    func openSettings(out: @escaping SettingsOut) -> SettingsIn? {
        guard let nc = self.navigationController else { return nil }
        let vc = SettingsViewController(out: out)
        nc.pushViewController(vc, animated: true)
        return vc.presenter
    }
}

extension ProfileViewController {

    convenience init(out: @escaping ProfileOut) {
        self.init(nibName: String(describing: ProfileViewController.self), bundle: nil)
        self.presenter = ProfilePresenter(view: self, out: out)
    }
}
