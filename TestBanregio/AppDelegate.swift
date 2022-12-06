//
//  AppDelegate.swift
//  TestBanregio
//
//  Created by Miguel Mexicano Herrera on 06/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeRouter()
        window?.rootViewController = home.view
        window?.makeKeyAndVisible()
        return true
    }
}

