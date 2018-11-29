//
//  TermsViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import GoogleSignIn

class TermsViewController: UIViewController {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var userId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func acceptAction(_ sender: UIButton) {
        UserDefaults.standard.set(firstName, forKey: "FASTBNB_USERINFO_FIRSTNAME")
        UserDefaults.standard.set(lastName, forKey: "FASTBNB_USERINFO_LASTNAME")
        UserDefaults.standard.set(email, forKey: "FASTBNB_USERINFO_EMAIL")
        UserDefaults.standard.set(userId, forKey: "FASTBNB_USERID")
        
        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController else { return }
        present(nextVC, animated: true)
    }
    
    @IBAction private func declineAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        
        guard let nextVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        present(nextVC, animated: true)
    }
}
