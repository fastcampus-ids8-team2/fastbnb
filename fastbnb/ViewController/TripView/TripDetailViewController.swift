//
//  TripDetailViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Auk

class TripDetailViewController: UIViewController {
    
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    @IBOutlet private weak var label3: UILabel!
    @IBOutlet private weak var label4: UILabel!
    @IBOutlet private weak var label5: UILabel!
    @IBOutlet private weak var label6: UILabel!
    @IBOutlet private weak var label7: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let trip = TripRoomData.shared.arrayOfData[TripRoomData.shared.selectRow]
        let room = ListingData.shared.arrayOfCellData.filter { data -> Bool in
            return data.pk == trip.room
            }[0]
        label1.text = room.roomAndPropertyType
        label2.text = room.publicAddress
        label3.text = "\(room.personCapacity) Available Homes"
        label4.text = "\(room.bathrooms) bathrooms, \(room.bedrooms) bedrooms, \(room.beds) beds"
        label5.text = room.roomName
        label6.text = "$\(Int.random(in: 10...1000)) per night"
        label7.text = "\(String(repeating: "⭐️", count: Int.random(in: 1...5))) \(Int.random(in: 1...1000)) \(Bool.random() ? "Superhost" : "")"
        for item in room.roomPhotos {
            scrollView.auk.show(url: item.roomPhoto)
        }
    }
    
}
