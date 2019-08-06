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

internal protocol RootViewIn: class {
    func openTabBar(
        feedTabOut: @escaping FeedTabOut,
        profileTabOut: @escaping ProfileTabOut,
        tabBarOut: @escaping TabBarOut
    )

    func openLogin(_ out: @escaping LoginOut)
}

internal protocol RootViewOut: class {
    func viewDidLoad()
}

typealias RootViewType = UINavigationController

// Mark: - Assembly

class RootAssembly {

    private let loginService: LoginService

    let tabBarAssembly: TabBarAssembly
    let loginAssembly: LoginAssembly

    init(
        loginService: LoginService,
        tabBarAssembly: TabBarAssembly,
        loginAssembly: LoginAssembly
    ) {
        self.loginService = loginService
        self.tabBarAssembly = tabBarAssembly
        self.loginAssembly = loginAssembly
    }

    func createModule(_ out: @escaping RootOut) -> RootViewType {
        let view = RootView()
        let presenter = RootPresenter(viewIn: view, loginService: self.loginService, out: out)
        view.viewOut = presenter
        view.assembly = self
        return view
    }
}
