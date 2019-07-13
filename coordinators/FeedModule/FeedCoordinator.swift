//
//  FeedCoordinator.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCoordinator: Coordinatable {

}

class FeedCoordinatorImpl: FeedCoordinator {

    let feedAssembly: FeedAssembly
    let navigationController: UINavigationController
    
    init(
        feedAssembly: FeedAssembly,
        navigationController: UINavigationController
    ) {
        self.feedAssembly = feedAssembly
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let feedViewController = feedAssembly.createFeedViewController()
        navigationController.setViewControllers([feedViewController], animated: animated)
    }
}
