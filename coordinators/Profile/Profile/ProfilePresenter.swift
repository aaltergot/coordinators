class ProfilePresenter: ProfileIn, ProfileViewOut {

    private weak var viewIn: ProfileViewIn?

    private let inOut: ProfileInOut
    private weak var out: ProfileOut?

    init(
        viewIn: ProfileViewIn?,
        inOut: @escaping ProfileInOut
    ) {
        self.viewIn = viewIn
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }

    func settingsButtonPressed() {
        self.out?.profileOpenSettings()
    }
}

extension ProfilePresenter: SettingsOut {
}
