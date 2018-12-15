//
//  CheckoutViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 15/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var requestToBook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    
 
         requestToBook.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
         requestToBook.layer.cornerRadius = 10
        
        
    }

}
