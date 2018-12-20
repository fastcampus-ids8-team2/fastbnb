//
//  CheckoutViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 15/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Alamofire

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
    var bookingSavedDate: [String] = []
    var numberOfDaysBooking = 0
    

    
    // MARK: check In date has to be created
    let guestNumbers = Int.random(in: 1...3)
   
    
    
    @IBOutlet weak var requestToBook: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewData()
        setupInitialButton()
        print("from checkoutView",bookingSavedDate)
       
    }
  


    private func setViewData() {
        guard let checkingoutData = data else { return }
        homeTypeAndCity.text = checkingoutData.roomAndPropertyType + " in " + checkingoutData.city
        roomPrice.text = "₩\(checkingoutData.price.withComma) per night"
        setupCell(imageName: checkingoutData.roomPhotos[0].roomPhoto)
        
        // MARK: booking number of days
        numberOfDaysBooking = bookingSavedDate.count
        
        let pricePerNightInt = checkingoutData.price
        let totalPerNIghtInt = pricePerNightInt * numberOfDaysBooking
        let serviceFeeInt = Int(Double(checkingoutData.price) * 0.18)
        let occupancyTaxInt = Int(Double(checkingoutData.price) * 0.05)
        let totalAmount = totalPerNIghtInt + serviceFeeInt + occupancyTaxInt
        guestNumber.text = "\(guestNumbers)"
        
        // MARK: fees & tax details
        pricePerNightAndNight.text = "₩\(pricePerNightInt.withComma) X \(numberOfDaysBooking) nights"
        pricePerNight.text = "₩\(totalPerNIghtInt.withComma)"
        serviceFee.text = "₩\(serviceFeeInt.withComma)"
        occupancyTax.text = "₩\(occupancyTaxInt.withComma)"
        totalCost.text = "₩\(totalAmount.withComma)"
        
      
        
        // MARK: checkin and checkout
        
        guard let checkIndateString = bookingSavedDate.first else { return }
        guard let checkOutdateString = bookingSavedDate.last else { return }
        
        checkInDate.text = checkIndateString
        checkOutDate.text = checkOutdateString
        

        



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
        
            bookingToBackEnd()
        
            present(bookingConfirmationVC, animated: true, completion: nil)

    }
    
    private func bookingToBackEnd() {
    
        guard let pk = data?.pk else { return }
        guard let url = URL(string: "https://backends.xyz/api/home/booking/") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
        ]
        guard let checkIndateString = bookingSavedDate.first else { return }
        guard let checkOutdateString = bookingSavedDate.last else { return }
        
        
        let parameters: Parameters = ["check_in_date": checkIndateString,
                                      "check_out_date": checkOutdateString,
                                      "num_guest": guestNumbers,
                                      "room": pk
                                     ]
        
        Alamofire.request(url,
                          method: .post,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: headers).validate().responseData { (response) in
            switch response.result {
            case .success(_):
                do {
                    print("room has been booked")
                    print(pk)
                    TripRoomData.shared.getDataFromServer()
                    
                } catch {
                    
                }
                
            case .failure(let error):
                print ("failed get logs: \(error)")
                print(pk)
                
                
            }
        }
    }
    
}


