import UIKit

// Mark: - Module

enum RootInCmd {
    case processDeepLink(String)
}

enum RootOutCmd {
    case register(RootIn)
}

typealias RootIn = ModuleIn<RootInCmd>
typealias RootOut = (RootOutCmd) -> Void

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
        feedTabOut: @escaping FeedTabOut,
        profileTabOut: @escaping ProfileTabOut,
        tabBarOut: @escaping TabBarOut
    )

    func openLogin(_ out: @escaping LoginOut)
}
