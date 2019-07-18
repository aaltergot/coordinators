class LoginAssembly {

    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func createModule(_ inOut: @escaping LoginInOut) -> LoginViewType {
        let view = LoginView(
            nibName: String(describing: LoginView.self),
            bundle: nil
        )
        let interactor = LoginInteractorImpl(loginService: self.loginService)
        let presenter = LoginPresenter(viewIn: view, interactor: interactor, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
