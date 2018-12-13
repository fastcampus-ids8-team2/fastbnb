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
import GoogleMaps
import GooglePlaces


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {


        //google Map APIs: AIzaSyC3hLFgaZajecmCxQ9G7oIzhEpoeXKgVU4
        GMSServices.provideAPIKey("AIzaSyC3hLFgaZajecmCxQ9G7oIzhEpoeXKgVU4")
        GMSPlacesClient.provideAPIKey("AIzaSyC3hLFgaZajecmCxQ9G7oIzhEpoeXKgVU4")
        
        setupRootViewController()
        ListingData.shared.getDataFromServer()
        SavedRoomData.shared.getDataFromServer()
        
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
           
        }
    }
}
