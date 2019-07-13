//
//  LoginAssembly.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol LoginAssembly {
    
    func createLoginViewController(loginService: LoginService) -> UIViewController
    
}

class LoginAssemblyImpl: LoginAssembly {
    
    func createLoginViewController(loginService: LoginService) -> UIViewController {
        let loginPresenter = LoginPresenterImpl(loginService: loginService)
        let loginViewController = LoginViewController(loginPresenter: loginPresenter)
        loginPresenter.loginView = loginViewController
        return loginViewController
    }
    
}
