import UIKit

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

    func createModule(_ inOut: @escaping RootInOut) -> RootViewType {
        let view = RootView()
        let interactor = RootInteractorImpl(loginService: self.loginService)
        let router = RootRouterImpl(navigationController: view, assembly: self)
        let presenter =
            RootPresenter(viewIn: view, interactor: interactor, router: router, inOut: inOut)
        view.viewOut = presenter
        return view
    }
}
