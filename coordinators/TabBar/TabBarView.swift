import Foundation
import UIKit

class TabBarView: TabBarViewType, TabBarViewIn {
    
    private let viewInOut: (TabBarView) -> TabBarViewOut?
    private lazy var viewOut = viewInOut(self)

    init(
        viewControllers: Array<UIViewController>,
        _ viewInOut: @escaping (TabBarView) -> TabBarViewOut?
    ) {
        self.viewInOut = viewInOut

        super.init(nibName: nil, bundle: nil)

        for viewController in viewControllers {
            self.addChild(viewController)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewOut?.viewDidLoad()
    }
}
