import UIKit

// Mark: - Module

enum RootInCommand {
    case processDeepLink(String)
}

protocol RootIn: class {
    func handle(_ command: RootInCommand)
}

protocol RootOut: class {
}

typealias RootInOut = (RootIn) -> RootOut?

// Mark: - View

protocol RootViewIn: class {
}

protocol RootViewOut: class {
    func viewDidLoad()
}

typealias RootViewType = UINavigationController

// Mark: - Interactor

protocol RootInteractor: class {
    func addLoginDelegate(_ delegate: LoginDelegate)
    func isUserLoggedIn() -> Bool
}

// Mark: - Router

protocol RootRouter: class {

    func openTabBar(
        feedTabInOut: @escaping FeedTabInOut,
        profileTabInOut: @escaping ProfileTabInOut,
        tabBarInOut: @escaping TabBarInOut
    )

    func openLogin(_ inOut: @escaping LoginInOut)
}
