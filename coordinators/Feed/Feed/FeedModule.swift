import UIKit

// Mark: - Module

enum FeedInCmd {
}

enum FeedOutCmd {
    case register(FeedIn)
}

typealias FeedIn = (FeedInCmd) -> Void
typealias FeedOut = (FeedOutCmd) -> Void

// Mark: - View

typealias FeedViewType = UIViewController
