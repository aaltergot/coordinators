import Foundation
import UIKit

protocol SelfStudyPageView: AnyObject {
}

public class SelfStudyPageViewController: UIViewController, SelfStudyPageView {
    public var moduleIn: SelfStudyPageIn { return self.presenter }
    private var presenter: SelfStudyPagePresenter!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }
}

extension SelfStudyPageViewController {
	public convenience init(
        out: @escaping SelfStudyPageOut,
        userInfoService: UserInfoService = SelfStudyServiceLocator.shared.userInfoService
    ) {
        let viewControllerType = SelfStudyPageViewController.self
        self.init(
            nibName: String(describing: viewControllerType),
            bundle: Bundle(for: viewControllerType)
        )
        self.presenter = SelfStudyPagePresenter(
            view: self,
            out: out,
            userInfoService: userInfoService
        )
    }
}
