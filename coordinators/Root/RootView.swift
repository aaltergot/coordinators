import UIKit

class RootView: RootViewType, RootViewIn {
    
    var viewOut: RootViewOut!
    unowned var assembly: RootAssembly!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut.viewDidLoad()
    }

    private func setupView() {
        self.setNavigationBarHidden(true, animated: false)
    }

    func openTabBar(
        feedTabOut: @escaping FeedTabOut,
        profileTabOut: @escaping ProfileTabOut,
        tabBarOut: @escaping TabBarOut
    ) {
        let tabBarView = self.assembly.tabBarAssembly.createModule(
            feedTabOut: feedTabOut,
            profileTabOut: profileTabOut,
            tabBarOut: tabBarOut
        )
        self.setViewControllers([tabBarView], animated: true)
    }

    func openLogin(_ out: @escaping LoginOut) {
        self.setViewControllers([self.assembly.loginAssembly.createModule(out)], animated: true)
    }
}
