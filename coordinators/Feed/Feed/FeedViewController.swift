import UIKit

protocol FeedView: class {
}

protocol FeedViewOut: class {
    func viewDidLoad()
}

class FeedViewController: UIViewController, FeedView {

    var presenter: (FeedViewOut & FeedIn)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    private func setupView() {
        self.title = "Feed"
    }
}

extension FeedViewController {

    convenience init(out: @escaping FeedOut) {
        self.init(nibName: String(describing: FeedViewController.self), bundle: nil)
        self.presenter = FeedPresenter(view: self, out: out)
    }
}
