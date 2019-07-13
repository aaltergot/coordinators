//
//  RootCoordinatorAssembly.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol RootCoordinatorAssembly {

    func createRootCoordinator() -> RootCoordinator

}

class RootCoordinatorAssemblyImpl: RootCoordinatorAssembly {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func createRootCoordinator() -> RootCoordinator {
        let loginService = LoginServiceImpl()
        let rootAssembly = RootAssemblyImpl(loginService: loginService)
        let loginCoordinatorAssembly = LoginCoordinatorAssemblyImpl(loginService: loginService)
        let tabBarCoordinatorAssembly = TabBarCoordinatorAssemblyImpl(loginService: loginService)
        
        return RootCoordinatorImpl(
            window: window,
            rootAssembly: rootAssembly,
            loginCoordinatorAssembly: loginCoordinatorAssembly,
            tabBarCoordinatorAssembly: tabBarCoordinatorAssembly
        )
    }

}
