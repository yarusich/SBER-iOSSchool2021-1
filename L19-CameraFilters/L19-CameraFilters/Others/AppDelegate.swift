//
//  AppDelegate.swift
//  L19-CameraFilters
//
//  Created by Антон Сафронов on 21.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let service = FilterService()
            
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = UINavigationController(rootViewController: SettingsViewController())
        window?.rootViewController = UINavigationController(rootViewController: ToBeViewController(filterService: service))
        window?.makeKeyAndVisible()
        
        return true
    }



}

