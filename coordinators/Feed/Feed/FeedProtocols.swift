import UIKit

// Mark: - Module

enum FeedInCmd {
}

enum FeedOutCmd {
    case loaded(FeedIn)
}

typealias FeedIn = (FeedInCmd) -> Void
typealias FeedOut = (FeedOutCmd) -> Void

// Mark: - View

protocol FeedViewIn: class {
}

protocol FeedViewOut: class {
    func viewDidLoad()
}

typealias FeedViewType = UIViewController
