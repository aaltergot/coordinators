class FeedPresenter: FeedViewOut {

    private weak var viewIn: FeedViewIn?

    private let out: FeedOut

    init(
        viewIn: FeedViewIn?,
        out: @escaping FeedOut
    ) {
        self.viewIn = viewIn
        self.out = out
    }

    func viewDidLoad() {
        self.out(.loaded { _ in })
    }
}
