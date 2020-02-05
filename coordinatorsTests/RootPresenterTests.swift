//
//  RootPresenterTests.swift
//  coordinatorsTests
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

/*
import XCTest
@testable import coordinators

fileprivate class RootViewInStub: RootViewIn {

    var showTabBarCalled = false
    var showLoginCalled = false

    func openMainTabBar(out: @escaping MainTabBarOut) -> MainTabBarIn? {
        self.showTabBarCalled = true
        return nil
    }

    func openLogin(out: @escaping LoginOut) -> LoginIn? {
        self.showLoginCalled = true
        return nil
    }
}

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

class RootPresenterTests: XCTestCase {
    
    fileprivate var loginServiceStub: LoginServiceStub!
    fileprivate var rootViewInStub: RootViewInStub!
    var rootPresenter: RootPresenter!
    
    override func setUp() {
        self.loginServiceStub = LoginServiceStub()
        self.rootViewInStub = RootViewInStub()
        self.rootPresenter = RootPresenter(
            viewIn: self.rootViewInStub,
            loginService: self.loginServiceStub,
            out: { _ in }
        )
    }

    override func tearDown() {
        loginServiceStub = nil
        rootViewInStub = nil
        rootPresenter = nil
    }
    
    func testUnauthorized() {
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootViewInStub.showLoginCalled, true)
    }
    
    func testAuthorized() {
        loginServiceStub.login()
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootViewInStub.showTabBarCalled, true)
    }
}

 */
