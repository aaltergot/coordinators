class LoginPresenter: LoginViewOut {

    private weak var viewIn: LoginViewIn?
    private let interactor: LoginInteractor

    private let out: LoginOut

    init(
        viewIn: LoginViewIn?,
        interactor: LoginInteractor,
        out: @escaping LoginOut
    ) {
        self.viewIn = viewIn
        self.interactor = interactor
        self.out = out
    }

    func viewDidLoad() {
        self.out(.register { _ in })
    }

    func loginButtonPressed() {
        self.interactor.login()
    }
}

