import UIKit

// Mark: - Module

protocol ProfileIn: class {
}

protocol ProfileOut: class {
}

typealias ProfileInOut = (ProfileIn) -> ProfileOut?

// Mark: - View

protocol ProfileViewIn: class {
}

protocol ProfileViewOut: class {
    func viewDidLoad()
    func settingsButtonPressed()
}

typealias ProfileViewType = UIViewController

// Mark: - Router

protocol ProfileRouter: class {
    func openSettings(_ inOut: @escaping SettingsInOut)
}