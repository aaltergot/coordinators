import Foundation
import UIKit

protocol LeadGenPageView: AnyObject {
}

public class LeadGenPageViewController: UIViewController, LeadGenPageView {
    public var moduleIn: LeadGenPageIn { return self.presenter }
    private var presenter: LeadGenPagePresenter!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

extension LeadGenPageViewController {
	public convenience init(
        out: @escaping LeadGenPageOut,
        userInfoService: UserInfoService = LeadGenServiceLocator.shared.userInfoService
    ) {
        let viewControllerType = LeadGenPageViewController.self
        self.init(
            nibName: String(describing: viewControllerType),
            bundle: Bundle(for: viewControllerType)
        )
        self.presenter = LeadGenPagePresenter(
            view: self,
            out: out,
            userInfoService: userInfoService
        )
    }
}
