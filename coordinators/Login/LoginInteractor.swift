class LoginInteractorImpl: LoginInteractor {

    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func login() {
        self.loginService.login()
    }
}
