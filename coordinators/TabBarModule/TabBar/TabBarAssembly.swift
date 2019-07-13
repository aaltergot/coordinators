//
//  TabBarAssembly.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarAssembly {
    
    func createTabBarController(viewControllers: Array<UIViewController>) -> UITabBarController
    
}

class TabBarAssemblyImpl: TabBarAssembly {
    
    func createTabBarController(viewControllers: Array<UIViewController>) -> UITabBarController {
        
        let tabBarPresenter = TabBarPresenterImpl()
        
        let tabBarController = TabBarController(
            tabBarPresenter: tabBarPresenter,
            viewControllers: viewControllers
        )
        
        tabBarPresenter.tabBarView = tabBarController
        
        return tabBarController
    }
    
}
