//
//  AppDelegate.swift
//  fastbnb
//
//  Created by WooJun Kim on 25/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        
        
        return true
    }
    
    func setupRootViewController() {
        if UserDefaults.standard.string(forKey: "FASTBNB_USERID") == nil {
            let newVC = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
            let oldVC = window?.rootViewController
            window?.rootViewController = newVC
            oldVC?.dismiss(animated: true)
        } else {
            let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            let oldVC = window?.rootViewController
            window?.rootViewController = newVC
            oldVC?.dismiss(animated: true)
            
            // add data from the server
            ListingData.shared.getDataFromServer()
        }
    }
}
