import UIKit

protocol FeedView: class {
}

protocol FeedViewOut: class {
    func viewDidLoad()
    func didPressButton()
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

    @IBAction func buttonPressed(_ sender: Any) {
        let coordinator = ProfileCoordinator(
            self.navigationController,
            push: true,
            out: { _ in })
        coordinator.openProfile()
    }
}

extension FeedViewController {

    convenience init(out: @escaping FeedOut) {
        self.init(nibName: String(describing: FeedViewController.self), bundle: nil)
        self.presenter = FeedPresenter(view: self, out: out)
    }
}
