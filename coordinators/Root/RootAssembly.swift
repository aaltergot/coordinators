import UIKit

class RootAssembly {

    private let loginService: LoginService

    let loginAssembly: LoginAssembly
    let feedTabAssembly: FeedTabAssembly
    let profileTabAssembly: ProfileTabAssembly
    
    init(
        loginService: LoginService,
        loginAssembly: LoginAssembly,
        feedTabAssembly: FeedTabAssembly,
        profileTabAssembly: ProfileTabAssembly
    ) {
        self.loginService = loginService
        self.feedTabAssembly = feedTabAssembly
        self.profileTabAssembly = profileTabAssembly
        self.loginAssembly = loginAssembly
    }

    func createCoordinator() -> RootCoordinator {
        return RootCoordinator(
            assembly: self,
            loginService: self.loginService)
    }
}
