import UIKit

// Mark: - Module

enum FeedTabInCmd {
}

enum FeedTabOutCmd {
    case register(FeedTabIn)
}

typealias FeedTabIn = ModuleIn<FeedTabInCmd>
typealias FeedTabOut = (FeedTabOutCmd) -> Void

// Mark: - View

protocol FeedTabViewIn: class {
}

protocol FeedTabViewOut: class {
    func viewCreated()
}

typealias FeedTabViewType = UINavigationController

// Mark: - Router

protocol FeedTabRouter: class {
    func openFeed(_ out: @escaping FeedOut)
}
