//
//  LoginViewController.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

protocol LoginView: class {
    
}

class LoginViewController: UIViewController, LoginView {

    let loginPresenter: LoginPresenter
    
    init(loginPresenter: LoginPresenter) {
        self.loginPresenter = loginPresenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginPresenter.loginButtonPressed()
    }

}
