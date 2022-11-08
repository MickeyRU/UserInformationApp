//
//  AppDelegate.swift
//  UserInformationApp
//
//  Created by Павел Афанасьев on 16.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationViewController = UINavigationController(rootViewController: MainViewController())
        // Убираем прозрачность навигейшен бара 
        if #available(iOS 13.0, *) {
            navigationViewController.navigationBar.scrollEdgeAppearance = navigationViewController.navigationBar.standardAppearance
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        return true
    }

}

