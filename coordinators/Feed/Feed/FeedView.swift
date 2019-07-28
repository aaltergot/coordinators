class FeedView: FeedViewType {

    var out: FeedOut!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.out(.register { _ in })
    }

    private func setupView() {
        self.title = "Feed"
    }
}
