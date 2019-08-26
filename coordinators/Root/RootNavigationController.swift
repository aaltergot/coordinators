import UIKit

internal protocol RootView: class {
}

internal protocol RootViewOut: class {
    func viewDidLoad()
}

class RootNavigationController: UINavigationController, RootView {
    
    var presenter: (RootIn & RootViewOut)!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    private func setupView() {
        self.setNavigationBarHidden(true, animated: false)
    }
}

extension RootNavigationController {

    convenience init(
        loginService: LoginService = LoginServiceImpl.shared,
        out: @escaping RootOut
    ) {
        self.init()
        self.presenter = RootPresenter(
            view: self,
            coordinator: NavigationRootCoordinator(self),
            loginService: loginService,
            out: out
        )
    }
}
