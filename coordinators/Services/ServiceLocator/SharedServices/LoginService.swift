import Foundation

public protocol HasLoginService {
    var loginService: LoginService! { get }
}

public protocol LoginService: class {
    
    func addDelegate(delegate: LoginDelegate)
    func isLoggedIn() -> Bool
    func login()
    func logout()
    
}

public protocol LoginDelegate {
    
    func didLogin()
    func didLogout()
    
}

public class LoginServiceImpl: LoginService {

    var authorized: Bool = false
    var delegates: Array<LoginDelegate> = Array()
    static var shared = LoginServiceImpl()
    
    public func isLoggedIn() -> Bool {
        return authorized
    }
    
    public func login() {
        authorized = true
        
        for delegate in delegates {
            delegate.didLogin()
        }
    }
    
    public func logout() {
        authorized = false
        
        for delegate in delegates {
            delegate.didLogout()
        }
    }
    
    public func addDelegate(delegate: LoginDelegate) {
        delegates.append(delegate)
    }
    
}
