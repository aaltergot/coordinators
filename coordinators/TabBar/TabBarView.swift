import Foundation
import UIKit


class TabBarView: TabBarViewType, TabBarViewIn {
    
    private let viewInOut: (TabBarView) -> TabBarViewOut?
    private lazy var viewOut = viewInOut(self)

    private let tabIndices: [TabBarTab : Int]

    init(
        tabs: [(TabBarTab, UIViewController)],
        _ viewInOut: @escaping (TabBarView) -> TabBarViewOut?
    ) {
        self.viewInOut = viewInOut

        var tabIndices = [TabBarTab : Int]()
        for (index, (tab, _)) in tabs.enumerated() {
            tabIndices[tab] = index
        }
        self.tabIndices = tabIndices

        super.init(nibName: nil, bundle: nil)

        tabs.forEach { _, vc in self.addChild(vc) }

        self.viewOut?.viewCreated()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func showTab(_ tab: TabBarTab) {
        guard let index = self.tabIndices[tab] else { return }
        self.selectedIndex = index
    }
}
