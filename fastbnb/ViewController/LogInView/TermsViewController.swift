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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func acceptAction(_ sender: UIButton) {
        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabbarController") as? UITabBarController else { return }
        present(nextVC, animated: true)
    }
    
    @IBAction private func declineAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        
        guard let nextVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
        present(nextVC, animated: true)
    }
}
