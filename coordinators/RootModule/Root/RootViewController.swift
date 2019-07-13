//
//  RootViewController.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol RootView: class {
    
}

class RootViewController: UINavigationController, RootView {
    
    let rootPresenter: RootPresenter
    
    init(rootPresenter: RootPresenter) {
        self.rootPresenter = rootPresenter;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarHidden(true, animated: false)
        
        rootPresenter.viewDidLoad()
    }

}
