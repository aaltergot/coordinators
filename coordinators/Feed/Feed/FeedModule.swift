import UIKit

// Mark: - Module

enum FeedInCmd {
}

enum FeedOutCmd {
    case register(FeedIn)
}

typealias FeedIn = ModuleIn<FeedInCmd>
typealias FeedOut = (FeedOutCmd) -> Void

// Mark: - View

typealias FeedViewType = UIViewController
