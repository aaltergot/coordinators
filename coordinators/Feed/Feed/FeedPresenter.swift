enum FeedOutCmd {
}

typealias FeedOut = (FeedOutCmd) -> Void

protocol FeedIn: class {
}

class FeedPresenter: FeedIn, FeedViewOut {

    private weak var view: FeedView?
    private let out: FeedOut

    private weak var settingsIn: SettingsIn?

    init(
        view: FeedView?,
        out: @escaping FeedOut
    ) {
        self.view = view
        self.out = out
    }

    func viewDidLoad() {
    }

    func didPressButton() {


    }
}
