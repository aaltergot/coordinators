import UIKit

// Mark: - Module

enum ProfileTabInCommand {
    case processDeepLink(String)
}

protocol ProfileTabIn: class {
    func handle(_ command: ProfileTabInCommand)
}

protocol ProfileTabOut: class {
}

typealias ProfileTabInOut = (ProfileTabIn) -> ProfileTabOut?

// Mark: - View

protocol ProfileTabViewIn: class {
}

protocol ProfileTabViewOut: class {
    func viewCreated()
}

typealias ProfileTabViewType = UINavigationController

// Mark: - Router

protocol ProfileTabRouter: class {
    func openProfile(_ inOut: @escaping ProfileInOut)
    func openSettings(_ inOut: @escaping SettingsInOut)
}
