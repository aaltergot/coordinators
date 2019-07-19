import UIKit

// Mark: - Module

enum TabBarTab: Hashable {
    case feed
    case profile
}

enum TabBarCommand {
    case showTab(TabBarTab)
}

protocol TabBarIn: class {
    func handle(_ command: TabBarCommand)
}

protocol TabBarOut: class {
}

typealias TabBarInOut = (TabBarIn) -> TabBarOut?

// Mark: - View

protocol TabBarViewIn: class {
    func showTab(_ tab: TabBarTab)
}

protocol TabBarViewOut: class {
    func viewCreated()
}

typealias TabBarViewType = UITabBarController
