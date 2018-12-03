//
//  HomesAroundTheWorldCollectionViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 28/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class HomesAroundTheWorldCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeOfHome: UILabel!
    @IBOutlet weak var dot: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    @IBOutlet weak var numberOfStar: UILabel!
    @IBOutlet weak var numberOfStarLabel: UILabel!
    
    
    var image: UIImage?

    

    
    
    
    func setupCell(homeType: String, city: String, roomPriceInfo: Int,roomTitle: String, /*numStar: String,numSLabel: Int,*/ image: String) {
        
        typeOfHome.text = homeType
        cityName.text = city
        roomName.text = roomTitle
        roomPrice.text = "\(roomPriceInfo) per night. Free cancellation"
//        numberOfStar.text = numStar
//        numberOfStarLabel.text = "\(numSLabel)"
        
        
        guard let imageUrl = URL(string: image) else { return }
    
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            
            
        }
        task.resume()
        
    }
    
    func setUpCell1(homeType: String) {
        typeOfHome.text = homeType
    }
    
    

}
