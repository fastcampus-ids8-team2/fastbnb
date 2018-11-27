//
//  ViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 25/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FacebookLogin
import AloeStackView
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func facebookLoginAction(_ sender: UIButton) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                guard let fbloginresult: FBSDKLoginManagerLoginResult = result else { return }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    if((FBSDKAccessToken.current()) != nil){
                        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) in
                            if (error == nil){
                                guard let result = result as? [String:String] else { return }
                                print(result)
                            }
                        })
                    }
                }
            }
        }
    }
    
    @IBAction private func googleLoginAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance().clientID = "979972481022-fsvh0i19939uv48008am9e0sop0kt894.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            print(user.profile.name)
            GIDSignIn.sharedInstance()?.signOut()
        } else {
            print(error.localizedDescription)
        }
    }
}
