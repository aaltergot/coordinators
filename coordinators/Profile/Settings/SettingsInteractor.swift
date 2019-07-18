class SettingsInteractorImpl: SettingsInteractor {

    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }

    func logout() {
        self.loginService.logout()
    }
}
