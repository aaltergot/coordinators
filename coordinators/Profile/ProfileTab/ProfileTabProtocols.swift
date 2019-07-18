import UIKit

// Mark: - Module

protocol ProfileTabIn: class {
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
}
