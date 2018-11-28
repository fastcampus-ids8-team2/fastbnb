//
//  SignInViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    
    var firstName: String?
    var lastName: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.text = firstName
        lastNameTextField.text = lastName
        emailTextField.text = email
    }
    
    @IBAction private func signInAction(_ sender: UIButton) {
        gotoNextViewController(firstName: firstNameTextField.text, lastName: lastNameTextField.text, email: emailTextField.text)
    }
    
    func gotoNextViewController(firstName: String?, lastName: String?, email: String?){
        guard let nextVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "TermsViewController") as? TermsViewController else { return }
        nextVC.firstName = firstName
        nextVC.lastName = lastName
        nextVC.email = email
        present(nextVC, animated: true)
    }
}
