//
//  CheckoutViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 15/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var personalTripButton: UIButton!
    @IBOutlet weak var businessTripButton: UIButton!
    
    @IBOutlet weak var requestToBook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialButton()
    }
    private func setupInitialButton() {
        // initial button Business and personal trip
        businessTripButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        businessTripButton.layer.borderWidth = 1
        businessTripButton.layer.cornerRadius = 5
        businessTripButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        businessTripButton.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        businessTripButton.setTitle("     Business trip     ", for: .normal)
        businessTripButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        personalTripButton.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        personalTripButton.layer.borderWidth = 1
        personalTripButton.layer.cornerRadius = 5
        personalTripButton.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        personalTripButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        personalTripButton.setTitle("     Personal trip     ", for: .normal)
        personalTripButton.setTitleColor(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), for: .normal)
        
        // request to book Button
        requestToBook.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        requestToBook.layer.cornerRadius = 10
    }
    @IBAction func didButtonTapPersonalTrip(_ sender: Any) {
        personalTripButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        personalTripButton.layer.borderWidth = 1
        personalTripButton.layer.cornerRadius = 5
        personalTripButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        personalTripButton.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        personalTripButton.setTitle("     Personal trip     ", for: .normal)
        personalTripButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        businessTripButton.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        businessTripButton.layer.borderWidth = 1
        businessTripButton.layer.cornerRadius = 5
        businessTripButton.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        businessTripButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        businessTripButton.setTitle("     Business trip     ", for: .normal)
        businessTripButton.setTitleColor(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), for: .normal)
    }
    
    @IBAction func didButtonTapBusinessTrip(_ sender: Any) {
        businessTripButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        businessTripButton.layer.borderWidth = 1
        businessTripButton.layer.cornerRadius = 5
        businessTripButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        businessTripButton.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        businessTripButton.setTitle("     Business trip     ", for: .normal)
        businessTripButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        
        personalTripButton.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        personalTripButton.layer.borderWidth = 1
        personalTripButton.layer.cornerRadius = 5
        personalTripButton.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        personalTripButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        personalTripButton.setTitle("     Personal trip     ", for: .normal)
        personalTripButton.setTitleColor(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1), for: .normal)
        
    }
    @IBAction func didTapRequestoBook(_ sender: UIButton) {
     
        let bookingConfirmationVC = storyboard?.instantiateViewController(withIdentifier: "BookingConfirmationViewController") as! BookingConfirmationViewController
        // delegation needed to pass the data
        
            present(bookingConfirmationVC, animated: true, completion: nil)

    }
    
}


