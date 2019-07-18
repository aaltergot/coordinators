import UIKit

class RootView: RootViewType, RootViewIn {
    
    var viewOut: RootViewOut?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        viewOut?.viewDidLoad()
    }

    private func setupView() {
        self.setNavigationBarHidden(true, animated: false)
    }
}
