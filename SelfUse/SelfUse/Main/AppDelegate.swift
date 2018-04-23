//
//  AppDelegate.swift
//  SelfUse
//
//  Created by 梁齐才 on 2018/4/10.
//  Copyright © 2018年 梁齐才. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        buildWindow()
        return true
    }
}



fileprivate extension AppDelegate {
    
    func buildWindow() {
        if  window == nil {
            window = UIWindow.init(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
        
        window?.rootViewController = RootController.init()
    }
}




