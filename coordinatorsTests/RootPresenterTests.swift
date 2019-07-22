//
//  RootPresenterTests.swift
//  coordinatorsTests
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import XCTest
@testable import coordinators

fileprivate class LoginServiceStub: LoginService {
    var authorized: Bool = false
    
    func addDelegate(delegate: LoginDelegate) {
        
    }
    
    func isLoggedIn() -> Bool {
        return authorized
    }
    
    func login() {
        authorized = true
    }
    
    func logout() {
        authorized = false
    }
    
}
