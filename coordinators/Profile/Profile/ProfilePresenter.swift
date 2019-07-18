class ProfilePresenter: ProfileIn, ProfileViewOut {

    private weak var viewIn: ProfileViewIn?
    private let router: ProfileRouter

    private let inOut: ProfileInOut
    private weak var out: ProfileOut?

    init(
        viewIn: ProfileViewIn?,
        router: ProfileRouter,
        inOut: @escaping ProfileInOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }

    func settingsButtonPressed() {
        self.router.openSettings { [weak self] _ in return self}
    }
}

extension ProfilePresenter: SettingsOut {
}
