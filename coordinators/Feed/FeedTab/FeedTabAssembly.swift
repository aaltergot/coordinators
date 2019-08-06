import UIKit

class FeedTabAssembly {

    let feedAssembly: FeedAssembly

    init(feedAssembly: FeedAssembly) {
        self.feedAssembly = feedAssembly
    }

    func createModule(_ out: @escaping FeedTabOut) -> FeedTabViewType {
        let view = FeedTabView { [weak self] view in
            guard let self = self else { return nil }
            let router = FeedTabRouterImpl(navigationController: view, assembly: self)
            return FeedTabPresenter(viewIn: view, router: router, out: out)
        }
        return view
    }
}
