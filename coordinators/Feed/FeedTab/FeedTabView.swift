import Foundation

class FeedTabView: FeedTabViewType, FeedTabViewIn {

    private let viewInOut: (FeedTabView) -> FeedTabViewOut?
    private lazy var viewOut = viewInOut(self)

    init(_ viewInOut: @escaping (FeedTabView) -> FeedTabViewOut?) {
        self.viewInOut = viewInOut

        super.init(nibName: nil, bundle: nil)

        self.setupView()
        self.viewOut?.viewCreated()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "Feed"
    }
}
