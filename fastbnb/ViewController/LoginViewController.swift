//
//  ViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 25/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var facebookLoginButton: FBSDKLoginButton!
    @IBOutlet private weak var googleLoginButton: UIButton!

    @IBAction private func facebookLoginAction(_ sender: UIButton) {
        print("facebook")
    }
    
    @IBAction private func googleLoginAction(_ sender: UIButton) {
        print("google")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

