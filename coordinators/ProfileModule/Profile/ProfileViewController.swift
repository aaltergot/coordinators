//
//  ProfileViewController.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

protocol ProfileView: class {
    
}

class ProfileViewController: UIViewController, ProfileView {
    
    let profilePresenter: ProfilePresenter
    
    init(profilePresenter: ProfilePresenter) {
        self.profilePresenter = profilePresenter
        super.init(nibName: "ProfileViewController", bundle: nil)
        self.title = "Profile"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        profilePresenter.settingsButtonPressed()
    }
}
