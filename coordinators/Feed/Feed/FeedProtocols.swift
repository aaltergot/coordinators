import UIKit

// Mark: - Module

protocol FeedIn: class {
}

protocol FeedOut: class {
}

typealias FeedInOut = (FeedIn) -> FeedOut?

// Mark: - View

protocol FeedViewIn: class {
}

protocol FeedViewOut: class {
    func viewDidLoad()
}

typealias FeedViewType = UIViewController
