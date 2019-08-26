protocol FeedTabIn: class {
}

enum FeedTabOutCmd {
}

typealias FeedTabOut = (FeedTabOutCmd) -> Void

class FeedTabPresenter: FeedTabIn, FeedTabViewOut {

    private weak var view: FeedTabView?
    private let out: FeedTabOut

    private weak var feedIn: FeedIn?

    init(
        view: FeedTabView?,
        out: @escaping FeedTabOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
        self.openFeed()
    }

    private func openFeed() {
        if self.feedIn == nil {
            self.feedIn = self.view?.openFeed { _ in }
        }
    }
}
