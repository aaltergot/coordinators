import Foundation

public protocol SelfStudyPageIn: AnyObject {
}

public typealias SelfStudyPageOut = (SelfStudyPageOutCmd) -> Void
public enum SelfStudyPageOutCmd {
}

class SelfStudyPagePresenter: SelfStudyPageIn {

    private weak var view: SelfStudyPageView?
    private let out: SelfStudyPageOut
    
    private let userInfoService: UserInfoService

    init(
        view: SelfStudyPageView?,
        out: @escaping SelfStudyPageOut,
        userInfoService: UserInfoService
    ) {
        self.view = view
        self.out = out
        self.userInfoService = userInfoService
    }

    func viewDidLoad() {
    }
}
