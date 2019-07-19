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

        let tabs: [(TabBarTab, UIViewController)] = [
            (.feed, self.feedTabAssembly.createModule(feedTabInOut)),
            (.profile, self.profileTabAssembly.createModule(profileTabInOut))
        ]

        return TabBarView(tabs: tabs) { view in
            return TabBarPresenter(viewIn: view, inOut: tabBarInOut)
        }
    }
}
