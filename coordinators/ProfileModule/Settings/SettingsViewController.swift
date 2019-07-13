//
//  SettingsViewController.swift
//  coordinators
//
//  Created by ak on 13/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

protocol SettingsView: class {
    
}

class SettingsViewController: UIViewController, SettingsView {
    
    let settingsPresenter: SettingsPresenter
    
    init(settingsPresenter: SettingsPresenter) {
        self.settingsPresenter = settingsPresenter
        super.init(nibName: "SettingsViewController", bundle: nil)
        self.title = "Settings"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        settingsPresenter.logoutButtonPressed()
    }
}
