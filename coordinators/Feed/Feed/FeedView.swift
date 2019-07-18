class FeedView: FeedViewType, FeedViewIn {

    var viewOut: FeedViewOut?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut?.viewDidLoad()
    }

    private func setupView() {
        self.title = "Feed"
    }
}
