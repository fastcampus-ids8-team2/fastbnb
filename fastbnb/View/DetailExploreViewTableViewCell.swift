//
//  DetailExploreViewTableViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class DetailExploreViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeFirstImage: UIImageView!
//    @IBOutlet weak var homeSecondImage: UIImageView!
//    @IBOutlet weak var homeThirdImage: UIImageView!
    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    
    @IBOutlet weak var numberOfStar: UILabel!
    @IBOutlet weak var numberOfReview: UILabel!
    
    
    func setupCell(homeType: String, city: String, roomPriceInfo: Int,roomTitle: String, /*numStar: String,numSLabel: Int,*/ image: String) {
        
        roomType.text = homeType
        cityName.text = city
        roomName.text = roomTitle
        roomPrice.text = "\(roomPriceInfo) per night. Free cancellation"
        
        
        guard let imageUrl = URL(string: image) else { return }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.homeFirstImage.image = UIImage(data: data)
            }
            
            
        }
        task.resume()
        
    }
    
    
}
