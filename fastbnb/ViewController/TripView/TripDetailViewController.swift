//
//  TripDetailViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Auk
import Alamofire

class TripDetailViewController: UIViewController {
    
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    @IBOutlet private weak var label3: UILabel!
    @IBOutlet private weak var label4: UILabel!
    @IBOutlet private weak var label5: UILabel!
    @IBOutlet private weak var label6: UILabel!
    @IBOutlet private weak var label7: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet weak var cancelBookingButton: UIButton!
    
    var bookingID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trip = TripRoomData.shared.arrayOfData[TripRoomData.shared.selectRow]
        let room = ListingData.shared.arrayOfCellData.filter { data -> Bool in
            return data.pk == trip.room
            }[0]
        label1.text = room.roomAndPropertyType
        label2.text = room.publicAddress
        label4.text = "\(room.bathrooms) bathrooms, \(room.bedrooms) bedrooms, \(room.beds) beds"
        label5.text = room.roomName
        label6.text = "₩\(room.price) per night"
        label7.text = "\(String(repeating: "⭐️", count: Int.random(in: 1...5))) \(Int.random(in: 1...1000)) \(Bool.random() ? "Superhost" : "")"
        for item in room.roomPhotos {
            scrollView.auk.show(url: item.roomPhoto)
        }
        bookingID = trip.id
        print("trip_id:",trip.id)
        print(trip.reservedDates)
        print(trip.checkOutDate)
        buttonSetup()
    }
    
    private func buttonSetup() {
        cancelBookingButton.layer.cornerRadius = 10
        
        
    }
    
    @IBAction func didTapCancelBooking(_ sender: UIButton) {
        
        
        let alertVC = UIAlertController(title: "Cancle Booking", message: "Do you really want to cancle booking?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
             self.bookingCancel()
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
        
        
       
    }
    
    
    private func bookingCancel() {
        

        guard let url = URL(string: "https://backends.xyz/api/home/booking_cancel/") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
        ]
        let parameters: Parameters = ["booking_id": bookingID]
        
        Alamofire.request(url,
                          method: .delete,
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: headers).validate().responseData { (response) in
                            switch response.result {
                            case .success(_):
                                do {
                                    print("room has been removed")
                                    
                                    TripRoomData.shared.getDataFromServer()
                                    
                                } catch {
                                    print(error)
                                }
                                
                            case .failure(let error):
                                print ("failed get logs: \(error)")
                                
                            }
        }
    }

    
    
}
