//
//  AppDelegate.swift
//  NASA Gallery
//
//  Created by Bindi Manek on 29/10/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
                window?.makeKeyAndVisible()
        return true
    }

    
}

