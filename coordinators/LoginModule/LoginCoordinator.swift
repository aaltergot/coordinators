//
//  LoginCoordinator.swift
//  coordinators
//
//  Created by ak on 07/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol LoginCoordinator: Coordinatable {
    
}

class LoginCoordinatorImpl: LoginCoordinator {

    var navigationController: UINavigationController
    let loginService: LoginService
    let loginAssembly: LoginAssembly
    
    init(
        loginService: LoginService,
        loginAssembly: LoginAssembly,
        navigationController: UINavigationController
    ) {
        self.loginService = loginService
        self.loginAssembly = loginAssembly
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let loginViewController = loginAssembly.createLoginViewController(loginService: loginService)
        
        navigationController.setViewControllers(
            [loginViewController],
            animated: animated
        )
    }
    
}
