import UIKit

protocol SettingsView: class {
}

protocol SettingsViewOut: class {
    func viewDidLoad()
    func didPressLogout()
}

class SettingsViewController: UIViewController {

    var presenter: (SettingsViewOut & SettingsIn)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        presenter.viewDidLoad()
    }

    private func setupView() {
        self.title = "Settings"
    }

    @IBAction func logoutButtonPressed() {
        presenter.didPressLogout()
    }
}

extension SettingsViewController: SettingsView {
}

extension SettingsViewController {

    convenience init(
        loginService: LoginService = LoginServiceImpl.shared,
        out: @escaping SettingsOut
    ) {
        self.init(nibName: String(describing: SettingsViewController.self), bundle: nil)
        self.presenter = SettingsPresenter(view: self, loginService: loginService, out: out)
    }
}
