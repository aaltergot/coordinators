class SettingsPresenter: SettingsViewOut {

    private weak var viewIn: SettingsViewIn?
    private let interactor: SettingsInteractor

    private let out: SettingsOut

    init(
        viewIn: SettingsViewIn?,
        interactor: SettingsInteractor,
        out: @escaping SettingsOut
    ) {
        self.viewIn = viewIn
        self.interactor = interactor
        self.out = out
    }

    func viewDidLoad() {
        self.out(.register(SettingsIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    func logoutButtonPressed() {
        self.interactor.logout()
    }

    private func invoke(_ cmd: SettingsInCmd) {
    }
}
