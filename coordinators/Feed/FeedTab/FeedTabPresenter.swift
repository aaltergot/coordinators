class FeedTabPresenter: FeedTabIn, FeedTabViewOut {

    private weak var viewIn: FeedTabViewIn?
    private let router: FeedTabRouter

    private let inOut: FeedTabInOut
    private weak var out: FeedTabOut?

    init(
        viewIn: FeedTabViewIn?,
        router: FeedTabRouter,
        inOut: @escaping FeedTabInOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.inOut = inOut
    }

    func viewCreated() {
        self.out = self.inOut(self)
        self.router.openFeed { [weak self] _ in return self }
    }
}

extension FeedTabPresenter: FeedOut {
}
