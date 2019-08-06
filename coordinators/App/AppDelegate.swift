import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private weak var rootIn: RootIn?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        let rootNavigationController = RootNavigationController { _ in }
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        self.window = window

        self.rootIn = rootNavigationController.presenter

        return true
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
            self.rootIn?.processDeepLink("profile/settings")
        } else {
            self.rootIn?.processDeepLink("feed")
        }
        self.evenActivation = !self.evenActivation
    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

