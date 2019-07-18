import UIKit

// Mark: - Module

protocol TabBarIn: class {
}

protocol TabBarOut: class {
}

typealias TabBarInOut = (TabBarIn) -> TabBarOut?

// Mark: - View

protocol TabBarViewIn: class {
}

protocol TabBarViewOut: class {
    func viewDidLoad()
}

typealias TabBarViewType = UITabBarController
