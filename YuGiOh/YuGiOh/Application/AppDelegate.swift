//
//  AppDelegate.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 8.04.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private lazy var appCoordinator = ApplicationCoordinator()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initializeRootView()
        return true
    }
}


// MARK: - Private methods

private extension AppDelegate {
    
    func initializeRootView() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        appCoordinator.start()
    }
}

