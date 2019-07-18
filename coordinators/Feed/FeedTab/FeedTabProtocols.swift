import UIKit

// Mark: - Module

protocol FeedTabIn: class {
}

protocol FeedTabOut: class {
}

typealias FeedTabInOut = (FeedTabIn) -> FeedTabOut?

// Mark: - View

protocol FeedTabViewIn: class {
}

protocol FeedTabViewOut: class {
    func viewCreated()
}

typealias FeedTabViewType = UINavigationController

// Mark: - Router

protocol FeedTabRouter: class {
    func openFeed(_ inOut: @escaping FeedInOut)
}
