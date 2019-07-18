class TabBarPresenter: TabBarIn, TabBarViewOut {

    private weak var viewIn: TabBarViewIn?

    private let inOut: TabBarInOut
    private weak var out: TabBarOut?

    init(
        viewIn: TabBarViewIn?,
        inOut: @escaping TabBarInOut
    ) {
        self.viewIn = viewIn
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }
}

extension TabBarPresenter: FeedTabOut {
}

extension TabBarPresenter: ProfileTabOut {
}
