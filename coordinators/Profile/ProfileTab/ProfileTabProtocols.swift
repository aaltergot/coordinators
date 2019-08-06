import UIKit

// Mark: - Module

enum ProfileTabInCmd {
    case processDeepLink(String)
}

enum ProfileTabOutCmd {
    case register(ProfileTabIn)
}

typealias ProfileTabIn = ModuleIn<ProfileTabInCmd>
typealias ProfileTabOut = (ProfileTabOutCmd) -> Void

// Mark: - View

protocol ProfileTabViewIn: class {
}

protocol ProfileTabViewOut: class {
    func viewCreated()
}

typealias ProfileTabViewType = UINavigationController

// Mark: - Router

protocol ProfileTabRouter: class {
    func openProfile(_ out: @escaping ProfileOut)
    func openSettings(_ out: @escaping SettingsOut)
}
