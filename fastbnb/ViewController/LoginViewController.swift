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
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var contentsView: UIView!
    @IBOutlet private weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aloeStackView = AloeStackView()
        contentsView.addSubview(aloeStackView)
        
        aloeStackView.translatesAutoresizingMaskIntoConstraints = false
        aloeStackView.topAnchor.constraint(equalTo: contentsView.topAnchor, constant: 0).isActive = true
        aloeStackView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 0).isActive = true
        aloeStackView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor, constant: 0).isActive = true
        aloeStackView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: 0).isActive = true
        aloeStackView.hidesSeparatorsByDefault = true
        
        let facebookLoginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
        facebookLoginButton.delegate = self
        aloeStackView.addRow(facebookLoginButton)
        
        let googleLoginButton = GIDSignInButton()
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        aloeStackView.addRow(googleLoginButton)
        
        let googleLogoutButton = UIButton()
        googleLogoutButton.setTitle("Google Logout", for: .normal)
        googleLogoutButton.backgroundColor = .blue
        googleLogoutButton.addTarget(self, action: #selector(googleLogoutAction), for: .touchUpInside)
        aloeStackView.addRow(googleLogoutButton)
        
    }
    
    @objc func googleLogoutAction() {
        GIDSignIn.sharedInstance().signOut()
    }
}

extension LoginViewController: LoginButtonDelegate {
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        switch result {
        case .success(_, _, let token):
            print(token.authenticationToken)
            
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name"])
            graphRequest.start(completionHandler: { (connection, result, error) in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                let fbData = result as! [String:AnyObject]
                let userName = fbData["name"]! as? NSString
                let userEmail = fbData["email"]! as? NSString
                
                print("userName:",userName!)
                print("userEmail",userEmail!)
            })
        case .failed(let error):
            print(error.localizedDescription)
        case .cancelled:
            print("cancelled")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("loginButtonDidLogOut")
    }
}

extension LoginViewController: GIDSignInUIDelegate {
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}

