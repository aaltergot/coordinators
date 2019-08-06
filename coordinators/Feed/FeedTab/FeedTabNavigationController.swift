import UIKit

protocol FeedTabView: class {
    func openFeed(out: @escaping FeedOut) -> FeedIn?
}

protocol FeedTabViewOut: class {
    func viewDidLoad()
}

class FeedTabNavigationController: UINavigationController {

    var presenter: (FeedTabIn & FeedTabViewOut)!

    init(out: @escaping FeedTabOut) {
        super.init(nibName: nil, bundle: nil)
        self.setupView()
        self.presenter = FeedTabPresenter(view: self, out: out)
        self.presenter.viewDidLoad()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "Feed"
    }
}

extension FeedTabNavigationController: FeedTabView {

    func openFeed(out: @escaping FeedOut) -> FeedIn? {
        let vc = FeedViewController(out: out)
        self.setViewControllers([vc], animated: false)
        return vc
    }
}
