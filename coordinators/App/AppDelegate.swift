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
    private var rootIn: RootIn?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootAssembly = self.makeRootAssembly()

        window.rootViewController = rootAssembly.createModule { [weak self] rootCmd in
            guard let self = self else { return }

            switch rootCmd {
            case let .register(rootIn): self.rootIn = rootIn
            }
        }
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

    private var evenActivation = false
    func applicationDidBecomeActive(_ application: UIApplication) {
        if (self.evenActivation) {
            self.rootIn?.invoke(.processDeepLink("profile/settings"))
        } else {
            self.rootIn?.invoke(.processDeepLink("feed"))
        }
        self.evenActivation = !self.evenActivation
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

