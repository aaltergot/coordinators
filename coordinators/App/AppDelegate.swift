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
    private var rootAssembly: RootAssembly?
    private var rootCoordinator: RootCoordinator?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootAssembly = self.makeRootAssembly()
        let rootCoordinator = rootAssembly.createCoordinator()
        rootCoordinator.run(window)
        window.makeKeyAndVisible()
        
        self.window = window
        self.rootCoordinator = rootCoordinator
        self.rootAssembly = rootAssembly

        return true
    }

    private func makeRootAssembly() -> RootAssembly {
        let loginService: LoginService = LoginServiceImpl()

        return RootAssembly(
            loginService: loginService,
            loginAssembly: LoginAssembly(loginService: loginService),
            feedTabAssembly: FeedTabAssembly(
                feedAssembly: FeedAssembly()
            ),
            profileTabAssembly: ProfileTabAssembly(
                profileAssembly: ProfileAssembly(
                    settingsAssembly: SettingsAssembly(
                        loginService: loginService
                    )
                )
            )
        )
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

