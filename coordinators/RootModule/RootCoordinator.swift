//
//  RootCoordinator.swift
//  coordinators
//
//  Created by ak on 07/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol RootCoordinator: Coordinatable {
    
    func showTabBar(animated: Bool)
    func showLogin(animated: Bool)
    
}

class RootCoordinatorImpl: RootCoordinator {

    let rootAssembly: RootAssembly
    let loginCoordinatorAssembly: LoginCoordinatorAssembly
    let tabBarCoordinatorAssembly: TabBarCoordinatorAssembly
    let window: UIWindow
    
    var loginCoordinator: LoginCoordinator?
    var tabBarCoordinator: TabBarCoordinator?
    var navigationController: UINavigationController?
    
    init(
        window: UIWindow,
        rootAssembly: RootAssembly,
        loginCoordinatorAssembly: LoginCoordinatorAssembly,
        tabBarCoordinatorAssembly: TabBarCoordinatorAssembly
    ) {
        self.window = window
        self.rootAssembly = rootAssembly
        self.loginCoordinatorAssembly = loginCoordinatorAssembly
        self.tabBarCoordinatorAssembly = tabBarCoordinatorAssembly
    }
    
    func start(animated: Bool) {
        navigationController = rootAssembly.createRootViewController(coordinator: self)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showTabBar(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        
        loginCoordinator = nil
        tabBarCoordinator = tabBarCoordinatorAssembly.createTabBarCoordinator(
            navigationController: navigationController
        )
        tabBarCoordinator?.start(animated: animated)
    }
    
    func showLogin(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        
        tabBarCoordinator = nil
        loginCoordinator = loginCoordinatorAssembly.createLoginCoordinator(
            navigationController: navigationController
        )
        loginCoordinator?.start(animated: animated)
    }

}
