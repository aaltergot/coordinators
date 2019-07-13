//
//  LoginCoordinatorAssembly.swift
//  coordinators
//
//  Created by Andrey Kucherenko on 30/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol LoginCoordinatorAssembly {
    
    func createLoginCoordinator(navigationController: UINavigationController) -> LoginCoordinator
    
}

class LoginCoordinatorAssemblyImpl: LoginCoordinatorAssembly {

    let loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createLoginCoordinator(navigationController: UINavigationController) -> LoginCoordinator {
        return LoginCoordinatorImpl(
            loginService: loginService,
            loginAssembly: LoginAssemblyImpl(),
            navigationController: navigationController
        )
    }
}
