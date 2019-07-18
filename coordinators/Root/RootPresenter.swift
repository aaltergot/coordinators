class RootPresenter: RootIn, RootViewOut {

    private weak var viewIn: RootViewIn?
    private let interactor: RootInteractor
    private let router: RootRouter

    private let inOut: RootInOut
    private weak var out: RootOut?

    init(
        viewIn: RootViewIn?,
        interactor: RootInteractor,
        router: RootRouter,
        inOut: @escaping RootInOut
    ) {
        self.viewIn = viewIn
        self.inOut = inOut
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        self.interactor.addLoginDelegate(self)
        if (self.interactor.isUserLoggedIn()) {
            self.router.openTabBar(
                feedTabInOut: { [weak self] _ in return self },
                profileTabInOut: { [weak self] _ in return self },
                tabBarInOut: { [weak self] _ in return self }
            )
        }
        else {
            self.router.openLogin { [weak self] _ in return self }
        }

        self.out = self.inOut(self)
    }
}

extension RootPresenter: LoginOut {
}

extension RootPresenter: TabBarOut {
}

extension RootPresenter: FeedTabOut {
}

extension RootPresenter: ProfileTabOut {
}

extension RootPresenter: LoginDelegate {

    func didLogin() {
        self.router.openTabBar(
            feedTabInOut: { [weak self] _ in return self },
            profileTabInOut: { [weak self] _ in return self },
            tabBarInOut: { [weak self] _ in return self }
        )
    }

    func didLogout() {
        self.router.openLogin { [weak self] _ in return self }
    }
}
