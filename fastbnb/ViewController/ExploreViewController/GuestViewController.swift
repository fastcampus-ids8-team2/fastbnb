//
//  GuestViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class GuestViewController: UIViewController {

    @IBOutlet weak var adultPlusButton: UIButton!
    @IBOutlet weak var adultMinusButton: UIButton!
    @IBOutlet weak var childrenPlusButton: UIButton!
    @IBOutlet weak var childrenMinusButton: UIButton!
    @IBOutlet weak var infantPlusButton: UIButton!
    @IBOutlet weak var infantMinusButton: UIButton!
    
    
    @IBOutlet weak var masterGuestView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        masterViewSetUp()
        self.buttonChangeToCircleBorder(adultPlusButton)
        
        
        
        
     
    }
    

    @IBAction func showResultsButtonTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    private func masterViewSetUp() {
        masterGuestView.layer.cornerRadius = 10
        masterGuestView.layer.masksToBounds = true
    }
    
    func buttonChangeToCircleBorder(_ object: UIButton) {
//        object.layer.cornerRadius = object.frame.size.width / 2
//        object. = UIColor(named: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
//        object.layer?.masksToBounds = true
//
    }
    
}
