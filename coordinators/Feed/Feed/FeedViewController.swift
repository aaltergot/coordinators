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

    var v: ProfileCoordinatorViewImpl? = nil
    var p: ProfileCoordinator? = nil
    @IBAction func buttonPressed(_ sender: Any) {
        let view = ProfileCoordinatorViewImpl(self.navigationController!, push: true)
        let presenter = ProfileCoordinator(view: view) { _ in }
        self.v = view
        self.p = presenter
        view.presenter = presenter
        presenter.openProfile()
    }
}

extension FeedViewController {

    convenience init(out: @escaping FeedOut) {
        self.init(nibName: String(describing: FeedViewController.self), bundle: nil)
        self.presenter = FeedPresenter(view: self, out: out)
    }
}
