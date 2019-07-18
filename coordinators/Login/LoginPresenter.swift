class LoginPresenter: LoginIn, LoginViewOut {

    private weak var viewIn: LoginViewIn?
    private let interactor: LoginInteractor

    private let inOut: LoginInOut
    private weak var out: LoginOut?

    init(
        viewIn: LoginViewIn?,
        interactor: LoginInteractor,
        inOut: @escaping LoginInOut
    ) {
        self.viewIn = viewIn
        self.interactor = interactor
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }

    func loginButtonPressed() {
        self.interactor.login()
    }
}

