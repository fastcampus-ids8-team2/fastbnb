//
//  BookingViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 11/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    var data: Result?
    
//    var oneImage = RoomPhoto()
    var image = String()
    var images = [String]()
    var roomData: [RoomPhoto] = []
    var arrayOfNumberOfRow = [Int]()
   
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var checkAvailability: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // bookingData from tapped Cell
        guard let bookingData = data else { return }
       checkAvailability.layer.cornerRadius = 10
        
        // fake data for arrayOfNumberOfRow. We need 13
        arrayOfNumberOfRow = [1,2,3,4,5,6,7,8,9,10,11,12,13]
        
        // room images in array
        for i in 0...bookingData.roomPhotos.count - 1 {
            images.append(bookingData.roomPhotos[i].roomPhoto)
        }
        
        
        
        image = bookingData.roomPhotos[0].roomPhoto
        roomData = bookingData.roomPhotos
        
        
        print("images:", images)
        
        
        
    }
    


 
}

extension BookingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayOfNumberOfRow.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if arrayOfNumberOfRow[indexPath.row] == 1 {
            let cell = Bundle.main.loadNibNamed("BookingImageTableViewCell", owner: self, options: nil)?.first as! BookingImageTableViewCell
        
            cell.setupCell(image: image)
            return cell
        } else{
            let cell = Bundle.main.loadNibNamed("BookingRoomHostInfoTableViewCell", owner: self, options: nil)?.first as! BookingRoomHostInfoTableViewCell
            cell.roomTitle.text = "I am awesome"
            return cell
            
        }
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
}
