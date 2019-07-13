//
//  RootAssembly.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol RootAssembly {
    
    func createRootViewController(coordinator: RootCoordinator) -> UINavigationController
    
}

class RootAssemblyImpl: RootAssembly {

    let loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createRootViewController(coordinator: RootCoordinator) -> UINavigationController {
        let rootPresenter = RootPresenterImpl(
            loginService: loginService,
            coordinator: coordinator
        )
        
        let rootViewController = RootViewController(rootPresenter: rootPresenter)
        
        rootPresenter.rootView = rootViewController
        
        return rootViewController
    }
    
}
