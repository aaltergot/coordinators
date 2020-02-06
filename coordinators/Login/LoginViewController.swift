import UIKit

protocol LoginView: class {
}

protocol LoginViewOut: class {
    func viewDidLoad()
    func didPressLogin()
}

class LoginViewController: UIViewController {

    var presenter: (LoginIn & LoginViewOut)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    private func setupView() {
        self.title = "Login"
    }

    @IBAction func loginButtonPressed() {
        self.presenter.didPressLogin()
    }
}

extension LoginViewController: LoginView{
}

extension LoginViewController {

    convenience init(
        loginService: LoginService = AppServiceLocator.shared.loginService,
        out: @escaping LoginOut
    ) {
        self.init(nibName: String(describing: LoginViewController.self), bundle: nil)
        self.presenter = LoginPresenter(view: self, loginService: loginService, out: out)
    }
}