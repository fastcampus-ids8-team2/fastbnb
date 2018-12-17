//
//  CheckoutViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 15/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    // first cell with room Info with room photo
    @IBOutlet weak var homeTypeAndCity: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    
    // second cell checkout and checkin Info
    @IBOutlet weak var checkInDate: UILabel!
    @IBOutlet weak var checkOutDate: UILabel!
    @IBOutlet weak var guestNumber: UILabel!
    
    //  personalTrip and business Trip
    @IBOutlet weak var personalTripButton: UIButton!
    @IBOutlet weak var businessTripButton: UIButton!
    
    @IBOutlet weak var pricePerNightAndNight: UILabel!
    @IBOutlet weak var pricePerNight: UILabel!
    @IBOutlet weak var serviceFee: UILabel!
    @IBOutlet weak var occupancyTax: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    
    
    var data: Result?
    //MARK: default is 3, it should be 0 and need to have calendar value

    var numberOfDaysBooking = 3

    
    
    @IBOutlet weak var requestToBook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewData()
        setupInitialButton()
        
    }
  


    private func setViewData() {
        guard let checkingoutData = data else { return }
        homeTypeAndCity.text = checkingoutData.roomAndPropertyType + " in " + checkingoutData.city
        roomPrice.text = "₩\(checkingoutData.price) per night"
        setupCell(imageName: checkingoutData.roomPhotos[0].roomPhoto)
        
        // MARK: check In date has to be created
        let guestNumbers = Int.random(in: 1...6)
        let pricePerNightInt = checkingoutData.price
        let serviceFeeInt = Int(Double(checkingoutData.price) * 0.18)
        let occupancyTaxInt = Int(Double(checkingoutData.price) * 0.05)
        let totalAmount = pricePerNightInt + serviceFeeInt + occupancyTaxInt
        
        guestNumber.text = "\(guestNumbers)"
        
        
        // MARK: fees & tax details
        pricePerNightAndNight.text = "₩\(pricePerNightInt) X \(numberOfDaysBooking) nights"
        pricePerNight.text = "₩\(pricePerNightInt)"
        serviceFee.text = "₩\(serviceFeeInt)"
        occupancyTax.text = "₩\(occupancyTaxInt)"
        totalCost.text = "₩\(totalAmount)"
        


    }
    private func setupCell(imageName: String) {
        
        guard let url = URL(string: imageName) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.roomImage.image = UIImage(data: data)
                self.roomImage.layer.cornerRadius = 10
                self.roomImage.layer.masksToBounds = true
            }
            }.resume()
        
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
     
//        print("data:",data)
        let bookingConfirmationVC = storyboard?.instantiateViewController(withIdentifier: "BookingConfirmationViewController") as! BookingConfirmationViewController
        
            present(bookingConfirmationVC, animated: true, completion: nil)

    }
    
}


