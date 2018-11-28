//
//  CalenderViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController {

    @IBOutlet weak var calendarPopupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarPopupView.layer.cornerRadius = 10
        calendarPopupView.layer.masksToBounds = true
        

    }
    @IBAction func showResult(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
