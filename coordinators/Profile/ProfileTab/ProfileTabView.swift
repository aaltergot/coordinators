import Foundation

class ProfileTabView: ProfileTabViewType, ProfileTabViewIn {

    private let viewInOut: (ProfileTabView) -> ProfileTabViewOut?
    private lazy var viewOut = viewInOut(self)

    init(_ viewInOut: @escaping (ProfileTabView) -> ProfileTabViewOut?) {
        self.viewInOut = viewInOut

        super.init(nibName: nil, bundle: nil)

        self.setupView()
        self.viewOut?.viewCreated()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.title = "ProfileTab"
    }
}
