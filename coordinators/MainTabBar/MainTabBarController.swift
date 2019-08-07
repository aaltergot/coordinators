import UIKit

protocol MainTabBarView: class {
    func addFeedTab(out: @escaping FeedTabOut)
    func addProfileTab(out: @escaping ProfileCoordinatorOut) -> ProfileCoordinatorIn?
    func showFeedTab()
    func showProfileTab()
}

protocol MainTabBarViewOut: class {
    func viewDidLoad()
}

class MainTabBarController: UITabBarController {

    var presenter: (MainTabBarIn & MainTabBarViewOut)!

    private enum Tab: Hashable {
        case feed
        case profile
    }
    private var tabIndices = [Tab : Int]()
}

extension MainTabBarController: MainTabBarView {

    func addFeedTab(out: @escaping FeedTabOut) {
        let feedTabNavigationController = FeedTabNavigationController(out: out)
        self.addChild(feedTabNavigationController)
        self.tabIndices[.feed] = self.children.count - 1
    }

    func addProfileTab(out: @escaping ProfileCoordinatorOut) -> ProfileCoordinatorIn? {
        let profileTabNavigationController = ProfileTabNavigationController(out: out)
        self.addChild(profileTabNavigationController)
        self.tabIndices[.profile] = self.children.count - 1
        return profileTabNavigationController.profileCoordinatorIn
    }

    func showFeedTab() {
        self.showTab(.feed)
    }

    func showProfileTab() {
        self.showTab(.profile)
    }

    private func showTab(_ tab: Tab) {
        guard let index = self.tabIndices[tab] else { return }
        self.selectedIndex = index
    }
}

extension MainTabBarController {

    convenience init(out: @escaping MainTabBarOut) {
        self.init(nibName: nil, bundle: nil)
        self.presenter = MainTabBarPresenter(view: self, out: out)
        self.presenter.viewDidLoad()
    }
}
