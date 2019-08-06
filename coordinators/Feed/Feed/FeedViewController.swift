import UIKit

protocol FeedIn: class {
}

enum FeedOutCmd {
}

typealias FeedOut = (FeedOutCmd) -> Void

class FeedViewController: UIViewController, FeedIn {

    private var out: FeedOut!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }

    private func setupView() {
        self.title = "Feed"
    }
}

extension FeedViewController {

    convenience init(out: @escaping FeedOut) {
        self.init(nibName: String(describing: FeedViewController.self), bundle: nil)
        self.out = out
    }
}
