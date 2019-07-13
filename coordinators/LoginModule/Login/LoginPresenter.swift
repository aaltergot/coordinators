//
//  LoginPresenter.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation

protocol LoginPresenter {
    
    func loginButtonPressed()
    
}

class LoginPresenterImpl: LoginPresenter {
    
    let loginService: LoginService
    unowned var loginView: LoginView?
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func loginButtonPressed() {
        loginService.login()
    }
}
