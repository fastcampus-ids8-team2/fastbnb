//
//  ViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 25/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func facebookLoginAction(_ sender: SocialLoginButton) {
        
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
                                self.gotoNextViewController(firstName: result["first_name"], lastName: result["last_name"], email: result["email"])
                            }
                        })
                    }
                }
            }
        }
    }
    
    @IBAction private func googleLoginAction(_ sender: SocialLoginButton) {
        GIDSignIn.sharedInstance().clientID = "979972481022-fsvh0i19939uv48008am9e0sop0kt894.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    func gotoNextViewController(firstName: String?, lastName: String?, email: String?){
        guard let nextVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController else { return }
        nextVC.firstName = firstName
        nextVC.lastName = lastName
        nextVC.email = email
        present(nextVC, animated: true)
    }
}

extension LoginViewController: GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            gotoNextViewController(firstName: user.profile.givenName, lastName: user.profile.familyName, email: user.profile.email)
        } else {
            print(error.localizedDescription)
        }
    }
}
