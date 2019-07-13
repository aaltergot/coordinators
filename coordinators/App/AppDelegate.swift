//
//  AppDelegate.swift
//  coordinators
//
//  Created by ak on 07/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootCoordinatorAssembly = RootCoordinatorAssemblyImpl(window: window!)
        let rootCoordinator: Coordinatable = rootCoordinatorAssembly.createRootCoordinator()
        rootCoordinator.start(animated: false)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

