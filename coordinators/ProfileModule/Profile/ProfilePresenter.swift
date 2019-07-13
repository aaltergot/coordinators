//
//  ProfilePresenter.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation

protocol ProfilePresenter {
    
    func settingsButtonPressed()
    
}

class ProfilePresenterImpl: ProfilePresenter {
    
    let coordinator: ProfileCoordinator
    unowned var profileView: ProfileView?
    
    init(coordinator: ProfileCoordinator) {
        self.coordinator = coordinator
    }
    
    func settingsButtonPressed() {
        coordinator.showSettings()
    }
}
