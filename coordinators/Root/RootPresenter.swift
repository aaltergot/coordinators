class RootPresenter: RootIn, RootViewOut {

    private weak var viewIn: RootViewIn?
    private let interactor: RootInteractor
    private let router: RootRouter

    private let inOut: RootInOut
    private weak var out: RootOut?

    private weak var tabBarIn: TabBarIn?
    private weak var feedTabIn: FeedTabIn?
    private weak var profileTabIn: ProfileTabIn?

    private var deferredDeepLink: String? = nil

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
            self.openTabBar()
        } else {
            self.openLogin()
        }

        self.out = self.inOut(self)
    }

    func handle(_ command: RootInCommand) {
        switch command {
        case let .processDeepLink(deepLink):
            guard let tabBarIn = self.tabBarIn ,
                  let profileTabIn = self.profileTabIn,
                  let _ = self.feedTabIn else {
                self.deferredDeepLink = deepLink
                return
            }
            let split = deepLink.split(separator: "/")
            if split.first == "profile" {
                tabBarIn.handle(.showTab(.profile))
                let rest = split.dropFirst().joined(separator: "/")
                if !rest.isEmpty {
                    profileTabIn.handle(.processDeepLink(rest))
                }
            } else {
                tabBarIn.handle(.showTab(.feed))
            }
            break
        }
    }

    private func processDeferredDeepLink() {
        guard let deepLink = self.deferredDeepLink else { return }
        self.deferredDeepLink = nil
        self.handle(.processDeepLink(deepLink))
    }

    private func openTabBar() {
        self.router.openTabBar(
            feedTabInOut: { [weak self] feedTabIn in
                self?.feedTabIn = feedTabIn
                self?.processDeferredDeepLink()
                return self
            },
            profileTabInOut: { [weak self] profileTabIn in
                self?.profileTabIn = profileTabIn
                self?.processDeferredDeepLink()
                return self
            },
            tabBarInOut: { [weak self] tabBarIn in
                self?.tabBarIn = tabBarIn
                self?.processDeferredDeepLink()
                return self
            }
        )
    }

    private func openLogin() {
        self.router.openLogin { [weak self] _ in return self }
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
        self.openTabBar()
    }

    func didLogout() {
        self.openLogin()
    }
}
