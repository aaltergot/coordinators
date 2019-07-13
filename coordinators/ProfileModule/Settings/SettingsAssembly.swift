//
//  SettingsAssembly.swift
//  coordinators
//
//  Created by ak on 13/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsAssembly {
    
    func createSettingsViewController() -> UIViewController
    
}

class SettingsAssemblyImpl: SettingsAssembly {
    
    let loginService: LoginService
    
    init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func createSettingsViewController() -> UIViewController {
        let settingsPresenter = SettingsPresenterImpl(loginService: loginService)
        let settingsViewController = SettingsViewController(settingsPresenter: settingsPresenter)
        settingsPresenter.settingsView = settingsViewController
        return settingsViewController
    }
    
}
