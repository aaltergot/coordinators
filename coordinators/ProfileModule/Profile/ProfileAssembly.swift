//
//  ProfileAssembly.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol ProfileAssembly {
    
    func createProfileViewController(coordinator: ProfileCoordinator) -> UIViewController
    
}

class ProfileAssemblyImpl: ProfileAssembly {
    
    func createProfileViewController(coordinator: ProfileCoordinator) -> UIViewController {
        let profilePresenter = ProfilePresenterImpl(coordinator: coordinator)
        let profileViewController = ProfileViewController(profilePresenter: profilePresenter)
        profilePresenter.profileView = profileViewController
        return profileViewController
    }
    
}
