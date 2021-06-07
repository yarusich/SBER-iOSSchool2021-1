//
//  AppDelegate.swift
//  L17-NSURLSession
//
//  Created by Антон Сафронов on 06.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        


        let service = PhotoNetworkService()

        let navigationController = UINavigationController()
        let rootViewController = ViewController(networkService: service as PhotoNetworkServiceProtocol)
        navigationController.viewControllers = [rootViewController]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }




}

