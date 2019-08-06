//
//  LoginService.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation

protocol LoginService: class {
    
    func addDelegate(delegate: LoginDelegate)
    func isLoggedIn() -> Bool
    func login()
    func logout()
    
}

protocol LoginDelegate {
    
    func didLogin()
    func didLogout()
    
}

class LoginServiceImpl: LoginService {

    var authorized: Bool = false
    var delegates: Array<LoginDelegate> = Array()
    static var shared = LoginServiceImpl()
    
    func isLoggedIn() -> Bool {
        return authorized
    }
    
    func login() {
        authorized = true
        
        for delegate in delegates {
            delegate.didLogin()
        }
    }
    
    func logout() {
        authorized = false
        
        for delegate in delegates {
            delegate.didLogout()
        }
    }
    
    func addDelegate(delegate: LoginDelegate) {
        delegates.append(delegate)
    }
    
}
