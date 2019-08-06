class RootPresenter: RootViewOut {

    private weak var viewIn: RootViewIn?
    private let loginService: LoginService

    private let out: RootOut

    private var tabBarIn: TabBarIn?
    private var feedTabIn: FeedTabIn?
    private var profileTabIn: ProfileTabIn?

    private var deferredDeepLink: String? = nil

    init(
        viewIn: RootViewIn?,
        loginService: LoginService,
        out: @escaping RootOut
    ) {
        self.viewIn = viewIn
        self.loginService = loginService
        self.out = out
    }

    func viewDidLoad() {
        self.loginService.addDelegate(delegate: self)
        if (self.loginService.isLoggedIn()) {
            self.openTabBar()
        } else {
            self.openLogin()
        }

        self.out(.register(RootIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    private func invoke(_ cmd: RootInCmd) { switch cmd {
    case let .processDeepLink(deepLink): self.processDeepLink(deepLink)
    }}

    private func processDeepLink(_ deepLink: String) {
        guard let tabBarIn = self.tabBarIn, tabBarIn.isAlive(),
              let profileTabIn = self.profileTabIn, profileTabIn.isAlive(),
              let feedTabIn = self.feedTabIn, feedTabIn.isAlive() else {
            self.deferredDeepLink = deepLink
            return
        }
        let split = deepLink.split(separator: "/")
        if split.first == "profile" {
            tabBarIn.invoke(.showTab(.profile))
            let rest = split.dropFirst().joined(separator: "/")
            if !rest.isEmpty {
                profileTabIn.invoke(.processDeepLink(rest))
            }
        } else {
            tabBarIn.invoke(.showTab(.feed))
        }
    }

    private func processDeferredDeepLink() {
        guard let deepLink = self.deferredDeepLink else { return }
        self.deferredDeepLink = nil
        self.processDeepLink(deepLink)
    }

    private func openTabBar() {
        self.viewIn?.openTabBar(
            feedTabOut: { [weak self] feedTabCmd in
                guard let self = self else { return }

                switch feedTabCmd {
                case let .register(feedTabIn):
                    self.feedTabIn = feedTabIn
                    self.processDeferredDeepLink()
                }
            },
            profileTabOut: { [weak self] profileTabCmd in
                guard let self = self else { return }

                switch profileTabCmd {
                case let .register(profileTabIn):
                    self.profileTabIn = profileTabIn
                    self.processDeferredDeepLink()
                }
            },
            tabBarOut: { [weak self] tabBarCmd in
                guard let self = self else { return }

                switch tabBarCmd {
                case let .register(tabBarIn):
                    self.tabBarIn = tabBarIn
                    self.processDeferredDeepLink()
                }
            }
        )
    }

    private func openLogin() {
        self.viewIn?.openLogin { _ in }
    }
}

extension RootPresenter: LoginDelegate {

    func didLogin() {
        self.openTabBar()
    }

    func didLogout() {
        self.openLogin()
    }
}
