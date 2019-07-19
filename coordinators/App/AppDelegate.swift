//
//  AppDelegate.swift
//  coordinators
//
//  Created by ak on 07/05/2019.
//  Copyright © 2019 ak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RootOut {

    var window: UIWindow?
    private var rootAssembly: RootAssembly?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootAssembly = self.makeRootAssembly()

        window.rootViewController = rootAssembly.createModule { [weak self] _ in return self }
        window.makeKeyAndVisible()

        self.window = window
        self.rootAssembly = rootAssembly

        return true
    }

    private func makeRootAssembly() -> RootAssembly {
        let loginService: LoginService = LoginServiceImpl()

        return RootAssembly(
            loginService: loginService,
            tabBarAssembly: TabBarAssembly(
                feedTabAssembly: FeedTabAssembly(
                    feedAssembly: FeedAssembly()
                ),
                profileTabAssembly: ProfileTabAssembly(
                    profileAssembly: ProfileAssembly(),
                    settingsAssembly: SettingsAssembly(
                        loginService: loginService
                    )
                )
            ),
            loginAssembly: LoginAssembly(loginService: loginService)
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

