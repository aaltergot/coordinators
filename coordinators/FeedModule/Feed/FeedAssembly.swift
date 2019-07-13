//
//  FeedAssembly.swift
//  coordinators
//
//  Created by ak on 08/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import Foundation
import UIKit

protocol FeedAssembly {
    
    func createFeedViewController() -> UIViewController
    
}

class FeedAssemblyImpl: FeedAssembly {
    
    func createFeedViewController() -> UIViewController {
        let feedPresenter = FeedPresenterImpl()
        let feedViewController = FeedViewController(feedPresenter: feedPresenter)
        feedPresenter.feedView = feedViewController
        return feedViewController
    }
    
}
