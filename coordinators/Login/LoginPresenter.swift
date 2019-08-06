protocol LoginIn: class {
}

enum LoginOutCmd {
}

typealias LoginOut = (LoginOutCmd) -> Void

class LoginPresenter: LoginIn, LoginViewOut {

    private weak var view: LoginView?
    private let loginService: LoginService
    private let out: LoginOut

    init(
        view: LoginView?,
        loginService: LoginService,
        out: @escaping LoginOut
    ) {
        self.view = view
        self.loginService = loginService
        self.out = out
    }

    func viewDidLoad() {
    }

    func didPressLogin() {
        self.loginService.login()
    }
}

