class FeedTabPresenter: FeedTabViewOut {

    private weak var viewIn: FeedTabViewIn?
    private let router: FeedTabRouter

    private let out: FeedTabOut

    init(
        viewIn: FeedTabViewIn?,
        router: FeedTabRouter,
        out: @escaping FeedTabOut
    ) {
        self.viewIn = viewIn
        self.router = router
        self.out = out
    }

    func viewCreated() {
        self.router.openFeed { _ in }
        self.out(.register(ModuleIn(ref: self) { [weak self] cmd in self?.invoke(cmd) }))
    }

    private func invoke(_ cmd: FeedTabInCmd) {}

}
