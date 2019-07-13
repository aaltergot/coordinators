//
//  RootPresenterTests.swift
//  coordinatorsTests
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import XCTest
@testable import coordinators

fileprivate class RootCoordinatorStub: RootCoordinator {

    var showTabBarCalled = false
    var showLoginCalled = false

    func showTabBar(animated: Bool) {
        showTabBarCalled = true
    }
    
    func showLogin(animated: Bool) {
        showLoginCalled = true
    }

    func start(animated: Bool) {
        
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
    fileprivate var rootCoordinatorStub: RootCoordinatorStub!
    var rootPresenter: RootPresenter!
    
    override func setUp() {
        loginServiceStub = LoginServiceStub()
        rootCoordinatorStub = RootCoordinatorStub()
        rootPresenter = RootPresenterImpl(
            loginService: loginServiceStub,
            coordinator: rootCoordinatorStub
        )
    }
    
    override func tearDown() {
        loginServiceStub = nil
        rootCoordinatorStub = nil
        rootPresenter = nil
    }
    
    func testUnauthorized() {
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootCoordinatorStub.showLoginCalled, true)
    }
    
    func testAuthorized() {
        loginServiceStub.login()
        rootPresenter.viewDidLoad()
        XCTAssertEqual(rootCoordinatorStub.showTabBarCalled, true)
    }
}
