class SettingsAssembly {
    
    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createModule(_ out: @escaping SettingsOut) -> SettingsViewType {
        let view = SettingsView(
            nibName: String(describing: SettingsView.self),
            bundle: nil
        )
        let interactor = SettingsInteractorImpl(loginService: self.loginService)
        let presenter = SettingsPresenter(viewIn: view, interactor: interactor, out: out)
        view.viewOut = presenter
        return view
    }
}
