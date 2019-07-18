//
//  RootPresenterTests.swift
//  coordinatorsTests
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import XCTest
@testable import coordinators

fileprivate class RootRouterStub: RootRouter {

    var showTabBarCalled = false
    var showLoginCalled = false

    func openTabBar(
        feedTabInOut: @escaping FeedTabInOut,
        profileTabInOut: @escaping ProfileTabInOut,
        tabBarInOut: @escaping TabBarInOut
    ) {
        self.showTabBarCalled = true
    }

    func openLogin(_ inOut: @escaping LoginInOut) {
        self.showLoginCalled = true
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
    fileprivate var rootRouterStub: RootRouterStub!
    var rootPresenter: RootPresenter!
    
    override func setUp() {
        loginServiceStub = LoginServiceStub()
        rootRouterStub = RootRouterStub()
        rootPresenter = RootPresenter(
            viewIn: nil,
            interactor: RootInteractorImpl(loginService: self.loginServiceStub),
            router: self.rootRouterStub,
            inOut: { _ in nil}
        )
    }

    override func tearDown() {
        loginServiceStub = nil
        rootRouterStub = nil
        rootPresenter = nil
    }
    
    func testUnauthorized() {
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootRouterStub.showLoginCalled, true)
    }
    
    func testAuthorized() {
        loginServiceStub.login()
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootRouterStub.showTabBarCalled, true)
    }
}
