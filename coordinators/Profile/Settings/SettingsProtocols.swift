import UIKit

// Mark: - Module

protocol SettingsIn: class {
}

protocol SettingsOut: class {
}

typealias SettingsInOut = (SettingsIn) -> SettingsOut?

// Mark: - View

protocol SettingsViewIn: class {
}

protocol SettingsViewOut: class {
    func viewDidLoad()
    func logoutButtonPressed()
}

typealias SettingsViewType = UIViewController

// Mark: - Interactor

protocol SettingsInteractor: class {
    func logout()
}
