//
//  TabBarCoordinatorAssembly.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarCoordinatorAssembly {

    func createTabBarCoordinator(navigationController: UINavigationController) -> TabBarCoordinator

}

class TabBarCoordinatorAssemblyImpl: TabBarCoordinatorAssembly {

    let loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createTabBarCoordinator(navigationController: UINavigationController) -> TabBarCoordinator {
        return TabBarCoordinatorImpl(
            profileCoordinatorAssembly: ProfileCoordinatorAssemblyImpl(loginService: loginService),
            feedCoordinatorAssembly: FeedCoordinatorAssemblyImpl(),
            tabBarAssembly: TabBarAssemblyImpl(),
            navigationController: navigationController
        )
    }
    
}
