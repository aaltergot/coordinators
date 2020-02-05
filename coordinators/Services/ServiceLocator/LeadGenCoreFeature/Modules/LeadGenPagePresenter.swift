import Foundation

public protocol LeadGenPageIn: AnyObject {
}

public typealias LeadGenPageOut = (LeadGenPageOutCmd) -> Void
public enum LeadGenPageOutCmd {
}

class LeadGenPagePresenter: LeadGenPageIn {

    private weak var view: LeadGenPageView?
    private let out: LeadGenPageOut
    
    private let userInfoService: UserInfoService

    init(
        view: LeadGenPageView?,
        out: @escaping LeadGenPageOut,
        userInfoService: UserInfoService
    ) {
        self.view = view
        self.out = out
        self.userInfoService = userInfoService
    }

    func viewDidLoad() {
    }
}
