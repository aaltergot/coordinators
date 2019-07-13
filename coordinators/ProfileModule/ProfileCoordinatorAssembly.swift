//
//  ProfileCoordinatorAssembly.swift
//  coordinators
//
//  Created by Andrey Kucherenko on 30/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileCoordinatorAssembly {
    
    func createProfileCoordinator(navigationController: UINavigationController) -> ProfileCoordinator
    
}

class ProfileCoordinatorAssemblyImpl: ProfileCoordinatorAssembly {

    let loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createProfileCoordinator(navigationController: UINavigationController) -> ProfileCoordinator {
        return ProfileCoordinatorImpl(
            loginService: loginService,
            profileAssembly: ProfileAssemblyImpl(),
            settingsAssembly: SettingsAssemblyImpl(loginService: loginService),
            navigationController: navigationController
        )
    }
    
}
