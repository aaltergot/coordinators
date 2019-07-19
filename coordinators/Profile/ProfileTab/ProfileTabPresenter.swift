class ProfileTabPresenter: ProfileTabIn, ProfileTabViewOut {

    private weak var viewIn: ProfileTabViewIn?
    private let router: ProfileTabRouter

    private let inOut: ProfileTabInOut
    private weak var out: ProfileTabOut?

    init(
        viewIn: ProfileTabViewIn?,
        router: ProfileTabRouter,
        inOut: @escaping ProfileTabInOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.inOut = inOut
    }

    func viewCreated() {
        self.out = self.inOut(self)
        self.router.openProfile { [weak self] _ in return self }
    }
}

extension ProfileTabPresenter: ProfileOut {
    func profileOpenSettings() {
        self.router.openSettings { [weak self] _ in return self }
    }
}

extension ProfileTabPresenter: SettingsOut {
}

