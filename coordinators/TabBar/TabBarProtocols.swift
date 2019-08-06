import UIKit

// Mark: - Module

enum TabBarTab: Hashable {
    case feed
    case profile
}

enum TabBarInCmd {
    case showTab(TabBarTab)
}

enum TabBarOutCmd {
    case register(TabBarIn)
}

typealias TabBarIn = ModuleIn<TabBarInCmd>
typealias TabBarOut = (TabBarOutCmd) -> Void

// Mark: - View

protocol TabBarViewIn: class {
    func showTab(_ tab: TabBarTab)
}

protocol TabBarViewOut: class {
    func viewCreated()
}

typealias TabBarViewType = UITabBarController
