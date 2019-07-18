import UIKit

// Mark: - Module

protocol LoginIn: class {
}

protocol LoginOut: class {
}

typealias LoginInOut = (LoginIn) -> LoginOut?

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
