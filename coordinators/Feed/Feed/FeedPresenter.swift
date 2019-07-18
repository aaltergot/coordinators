class FeedPresenter: FeedIn, FeedViewOut {

    private weak var viewIn: FeedViewIn?

    private let inOut: FeedInOut
    private weak var out: FeedOut?

    init(
        viewIn: FeedViewIn?,
        inOut: @escaping FeedInOut
    ) {
        self.viewIn = viewIn
        self.inOut = inOut
    }

    func viewDidLoad() {
        self.out = self.inOut(self)
    }
}
