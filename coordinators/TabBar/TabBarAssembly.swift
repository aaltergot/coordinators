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
        feedTabOut: @escaping FeedTabOut,
        profileTabOut: @escaping ProfileTabOut,
        tabBarOut: @escaping TabBarOut
    ) -> TabBarViewType {

        let tabs: [(TabBarTab, UIViewController)] = [
            (.feed, self.feedTabAssembly.createModule(feedTabOut)),
            (.profile, self.profileTabAssembly.createModule(profileTabOut))
        ]

        return TabBarView(tabs: tabs) { view in
            return TabBarPresenter(viewIn: view, out: tabBarOut)
        }
    }
}
