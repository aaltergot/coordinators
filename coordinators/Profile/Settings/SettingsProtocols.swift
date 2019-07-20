import UIKit

// Mark: - Module

enum SettingsInCmd {
}

enum SettingsOutCmd {
    case register(SettingsIn)
}

typealias SettingsIn = ModuleIn<SettingsInCmd>
typealias SettingsOut = (SettingsOutCmd) -> Void

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
