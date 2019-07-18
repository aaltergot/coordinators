class RootInteractorImpl: RootInteractor {

    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func addLoginDelegate(_ delegate: LoginDelegate) {
        self.loginService.addDelegate(delegate: delegate)
    }

    func isUserLoggedIn() -> Bool {
        return loginService.isLoggedIn()
    }
}
