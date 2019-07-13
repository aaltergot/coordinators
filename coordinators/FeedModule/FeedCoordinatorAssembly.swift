//
//  FeedCoordinatorAssembly.swift
//  coordinators
//
//  Created by Andrey Kucherenko on 30/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCoordinatorAssembly {
    
    func createFeedCoordinator(navigationController: UINavigationController) -> FeedCoordinator
    
}

class FeedCoordinatorAssemblyImpl: FeedCoordinatorAssembly {
    
    func createFeedCoordinator(navigationController: UINavigationController) -> FeedCoordinator {
        return FeedCoordinatorImpl(
            feedAssembly: FeedAssemblyImpl(),
            navigationController: navigationController
        )
    }
    
}
