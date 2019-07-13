//
//  FeedViewController.swift
//  coordinators
//
//  Created by ak on 12/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

protocol FeedView: class {
    
}

class FeedViewController: UIViewController, FeedView {
    
    let feedPresenter: FeedPresenter
    
    init(feedPresenter: FeedPresenter) {
        self.feedPresenter = feedPresenter;
        super.init(nibName: "FeedViewController", bundle: nil)
        self.title = "Feed"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
