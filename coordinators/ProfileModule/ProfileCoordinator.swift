//
//  ProfileCoordinator.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileCoordinator: Coordinatable {
    
    func showSettings()
    
}

class ProfileCoordinatorImpl: ProfileCoordinator {
    
    let profileAssembly: ProfileAssembly
    let settingsAssembly: SettingsAssembly
    let navigationController: UINavigationController
    
    init(
        loginService: LoginService,
        profileAssembly: ProfileAssembly,
        settingsAssembly: SettingsAssembly,
        navigationController: UINavigationController
    ) {
        self.profileAssembly = profileAssembly
        self.settingsAssembly = settingsAssembly
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let profileViewControoler = profileAssembly.createProfileViewController(coordinator: self)
        navigationController.setViewControllers([profileViewControoler], animated: animated)
    }
    
    func showSettings() {
        let settingsViewController = settingsAssembly.createSettingsViewController()
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
}
