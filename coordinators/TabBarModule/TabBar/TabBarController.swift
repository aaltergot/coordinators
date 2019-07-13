//
//  TabBarController.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarView: class {
    
}

class TabBarController: UITabBarController, TabBarView {
    
    let tabBarPresenter: TabBarPresenter
    
    init(
        tabBarPresenter: TabBarPresenter,
        viewControllers: Array<UIViewController>
    ) {
        self.tabBarPresenter = tabBarPresenter;
        
        super.init(nibName: nil, bundle: nil)
        
        for viewController in viewControllers {
            self.addChild(viewController)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
