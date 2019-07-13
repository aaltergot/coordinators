//
//  SettingsPresenter.swift
//  coordinators
//
//  Created by ak on 13/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation

protocol SettingsPresenter {
    
    func logoutButtonPressed()
    
}

class SettingsPresenterImpl: SettingsPresenter {
    
    let loginService: LoginService
    unowned var settingsView: SettingsView?
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func logoutButtonPressed() {
        loginService.logout()
    }
}
