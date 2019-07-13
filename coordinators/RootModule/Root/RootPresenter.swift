//
//  RootPresenter.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation

protocol RootPresenter {
    func viewDidLoad()
}

class RootPresenterImpl: RootPresenter, LoginDelegate {

    unowned var rootView: RootView?
    let loginService: LoginService
    let coordinator: RootCoordinator
    
    init(
        loginService: LoginService,
        coordinator: RootCoordinator
    ) {
        self.loginService = loginService
        self.coordinator = coordinator
        
        loginService.addDelegate(delegate: self)
    }
    
    func viewDidLoad() {
        if (loginService.isLoggedIn()) {
            coordinator.showTabBar(animated: false)
        }
        else {
            coordinator.showLogin(animated: false)
        }
    }
    
    func didLogin() {
        coordinator.showTabBar(animated: true)
    }
    
    func didLogout() {
        coordinator.showLogin(animated: true)
    }
    
}
