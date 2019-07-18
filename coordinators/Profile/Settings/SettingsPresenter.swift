class SettingsPresenter: SettingsIn, SettingsViewOut {

    private weak var viewIn: SettingsViewIn?
    private let interactor: SettingsInteractor

    private let inOut: SettingsInOut
    private weak var out: SettingsOut?

    init(
        viewIn: SettingsViewIn?,
        interactor: SettingsInteractor,
        inOut: @escaping SettingsInOut
    ) {
        self.viewIn = viewIn
        self.interactor = interactor
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }

    func logoutButtonPressed() {
        self.interactor.logout()
    }
}
