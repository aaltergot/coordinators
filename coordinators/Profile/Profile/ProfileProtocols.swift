import UIKit

// Mark: - Module

enum ProfileInCmd {
}

enum ProfileOutCmd {
    case register(ProfileIn)
    case openSettings
    case getData((String) -> Void) // example of data query
}

typealias ProfileIn = ModuleIn<ProfileInCmd>
typealias ProfileOut = (ProfileOutCmd) -> Void

// Mark: - View

protocol ProfileViewIn: class {
}

protocol ProfileViewOut: class {
    func viewDidLoad()
    func settingsButtonPressed()
}

typealias ProfileViewType = UIViewController
