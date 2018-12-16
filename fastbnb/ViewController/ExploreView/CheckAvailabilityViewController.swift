//
//  CheckAvailabilityViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 14/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit


class CheckAvailabilityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    @IBAction func didTapSaveButton(_ sender: Any) {
        guard let bookinViewVC = storyboard?.instantiateViewController(withIdentifier: "BookingViewController") as? BookingViewController else { return }
        
//        bookinViewVC.checkAvailability.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        
    }
    
    
}
