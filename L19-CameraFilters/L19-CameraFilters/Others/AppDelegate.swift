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
        
        //MainViewController = AsIsViewController
        //SecondViewController = ToBeViewController
        
//        let filterService = FilterService()
//        let mainViewController = MainViewController(filterService: filterService)
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        
        window?.rootViewController = UINavigationController(rootViewController: AsIsViewController())
        window?.makeKeyAndVisible()
        
        return true
    }



}

