import UIKit

// Mark: - Module

enum LoginInCmd {
}

enum LoginOutCmd {
    case register(LoginIn)
}

typealias LoginIn = ModuleIn<LoginInCmd>
typealias LoginOut = (LoginOutCmd) -> Void

// Mark: - View

protocol LoginViewIn: class {
}

protocol LoginViewOut: class {
    func viewDidLoad()
    func loginButtonPressed()
}

typealias LoginViewType = UIViewController

// Mark: - Interactor

protocol LoginInteractor: class {
    func login()
}
