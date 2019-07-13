//
//  LoginServiceTests.swift
//  coordinatorsTests
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import XCTest
@testable import coordinators

fileprivate class LoginDelegateStub: LoginDelegate {
    var didLoginCalled = false
    var didLogoutCalled = false
    
    func didLogin() {
        didLoginCalled = true
    }
    
    func didLogout() {
        didLogoutCalled = true
    }
}
    
class LoginServiceTests: XCTestCase {
    
    var loginService: LoginService!
    fileprivate var loginDelegateStub: LoginDelegateStub!
    
    override func setUp() {
        loginService = LoginServiceImpl()
        loginDelegateStub = LoginDelegateStub()
        loginService.addDelegate(delegate: loginDelegateStub)
    }
    
    override func tearDown() {
        loginDelegateStub = nil
        loginService = nil
    }
    
    func testLogin() {
        loginService.login()
        XCTAssertEqual(loginService.isLoggedIn(), true)
        XCTAssertEqual(loginDelegateStub.didLoginCalled, true)
    }
    
    func testLogout() {
        loginService.logout()
        XCTAssertEqual(loginService.isLoggedIn(), false)
        XCTAssertEqual(loginDelegateStub.didLogoutCalled, true)
    }
    
}
