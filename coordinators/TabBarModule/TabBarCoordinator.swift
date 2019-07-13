//
//  TabBarCoordinator.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarCoordinator: Coordinatable {

}

class TabBarCoordinatorImpl: TabBarCoordinator {
    
    let tabBarAssembly: TabBarAssembly
    let profileCoordinatorAssembly: ProfileCoordinatorAssembly
    let feedCoordinatorAssembly: FeedCoordinatorAssembly
    
    var profileCoordinator: ProfileCoordinator?
    var feedCoordinator: FeedCoordinator?
    let navigationController: UINavigationController
    
    init(
        profileCoordinatorAssembly: ProfileCoordinatorAssembly,
        feedCoordinatorAssembly: FeedCoordinatorAssembly,
        tabBarAssembly: TabBarAssembly,
        navigationController: UINavigationController
    ) {
        self.tabBarAssembly = tabBarAssembly
        self.profileCoordinatorAssembly = profileCoordinatorAssembly
        self.feedCoordinatorAssembly = feedCoordinatorAssembly
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let feedNavigationController = UINavigationController(nibName: nil, bundle: nil)
        feedNavigationController.title = "Feed"
        feedCoordinator = feedCoordinatorAssembly.createFeedCoordinator(
            navigationController: feedNavigationController
        )
        
        let profileNavigationController = UINavigationController(nibName: nil, bundle: nil)
        profileNavigationController.title = "Profile"
        profileCoordinator = profileCoordinatorAssembly.createProfileCoordinator(
            navigationController: profileNavigationController
        )
        
        let tabBarController = tabBarAssembly.createTabBarController(
            viewControllers: [
                feedNavigationController,
                profileNavigationController
            ]
        )
        
        feedCoordinator?.start(animated: false)
        profileCoordinator?.start(animated: false)
        
        navigationController.setViewControllers([tabBarController], animated: animated)
    }
    
    
}
