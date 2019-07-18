import UIKit

class TabBarAssembly {

    private let feedTabAssembly: FeedTabAssembly
    private let profileTabAssembly: ProfileTabAssembly

    init(
        feedTabAssembly: FeedTabAssembly,
        profileTabAssembly: ProfileTabAssembly
    ) {
        self.feedTabAssembly = feedTabAssembly
        self.profileTabAssembly = profileTabAssembly
    }

    func createModule(
        feedTabInOut: @escaping FeedTabInOut,
        profileTabInOut: @escaping ProfileTabInOut,
        tabBarInOut: @escaping TabBarInOut
    ) -> TabBarViewType {

        let tabs = [
            self.feedTabAssembly.createModule(feedTabInOut),
            self.profileTabAssembly.createModule(profileTabInOut)
        ]

        return TabBarView(viewControllers: tabs) { view in
            return TabBarPresenter(viewIn: view, inOut: tabBarInOut)
        }
    }
}
