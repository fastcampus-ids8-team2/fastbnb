//
//  HomesAroundTheWorldCollectionViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 28/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Alamofire

class HomesAroundTheWorldCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var typeOfHome: UILabel!
    @IBOutlet weak var dot: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    @IBOutlet weak var numberOfStar: UILabel!
    @IBOutlet weak var numberOfStarLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var image: UIImage?
    var buttonHasPressed = true

    var pk = Int()
    
    

    @IBAction func buttonDidTap(_ sender: UIButton) {
//        print(self)
        print(pk)
       
        buttonPressed()
            guard let url = URL(string: "https://backends.xyz/api/user/save_room/") else { return }
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
            ]
        let parameters: Parameters = ["room_id": pk]
        
            Alamofire.request(url, method: .post, parameters: parameters, headers: headers).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                       print(data)
//                        self.saveButton.imageView?.image = UIImage(contentsOfFile: "loveTapped")
                        
                    } catch {
                        
                    }
                    
                case .failure(let error):
                    print ("failed get logs: \(error)")
                }
                
                
            }
        

        
        
        //toServer.sendRoomName
    }
    
    private func buttonPressed() {
        
        if buttonHasPressed == true {
            
            
            
        }
        
        buttonHasPressed = !buttonHasPressed
        
    }
    
    
    
    func setupCell(homeType: String, city: String, roomPriceInfo: Int,roomTitle: String, /*numStar: String,numSLabel: Int,*/ image: String) {
        
        typeOfHome.text = homeType
        cityName.text = city
        roomName.text = roomTitle
        roomPrice.text = "\(roomPriceInfo) per night. Free cancellation"
        

        
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
