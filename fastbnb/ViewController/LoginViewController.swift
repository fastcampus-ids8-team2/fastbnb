//
//  ViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 25/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let facebookLoginButton = LoginButton(readPermissions: [ .publicProfile ])
        let googleLoginButton = UIButton()
        
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentsView.addSubview(facebookLoginButton)
    }

    func addContraints() {
        
    }
}

