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

    func viewCreated() {
        self.out = self.inOut(self)
    }

    func handle(_ command: TabBarCommand) {
        switch command {
        case let .showTab(tab):
            self.viewIn?.showTab(tab)
        }
    }
}

extension TabBarPresenter: FeedTabOut {
}

extension TabBarPresenter: ProfileTabOut {
}
