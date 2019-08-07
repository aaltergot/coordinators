enum SettingsOutCmd {
    case done
}

typealias SettingsOut = (SettingsOutCmd) -> Void

protocol SettingsIn: class {
}

class SettingsPresenter: SettingsIn, SettingsViewOut {

    private weak var view: SettingsView?
    private let loginService: LoginService
    private let out: SettingsOut

    init(
        view: SettingsView?,
        loginService: LoginService,
        out: @escaping SettingsOut
    ) {
        self.view = view
        self.loginService = loginService
        self.out = out
    }

    func viewDidLoad() {
//        self.out(.done)
    }

    func didPressLogout() {
        self.loginService.logout()
    }
}
