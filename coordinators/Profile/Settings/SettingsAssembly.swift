class SettingsAssembly {
    
    private let loginService: LoginService

    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createModule(_ inOut: @escaping SettingsInOut) -> SettingsViewType {
        let view = SettingsView(
            nibName: String(describing: SettingsView.self),
            bundle: nil
        )
        let interactor = SettingsInteractorImpl(loginService: self.loginService)
        let presenter = SettingsPresenter(viewIn: view, interactor: interactor, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
