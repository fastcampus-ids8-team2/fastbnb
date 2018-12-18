//
//  DetailExploreViewTableViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Alamofire

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
    @IBOutlet weak var saveButton: UIButton!
    
    var roomHasSavedButton = false
    var pk = Int()
    
    

    
    @IBAction func saveButtonDidTap(_ sender: UIButton) {
        print("it has been tapped")
        saveHasPressedButton()
    }
    
    
    private func saveHasPressedButton() {
        
        //reload data from saveRoom
        
        
        if roomHasSavedButton == false {
            print(pk)
            
            SavedRoomData.shared.getDataFromServer()
            
            saveButton.setImage(#imageLiteral(resourceName: "loveTapped"), for: .normal)
            roomHasSavedButton.toggle()
            
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
                    } catch {
                        print("error has caught in saveButton Look at HomesAroundtheWorldViewCell")

                    }
                    
                case .failure(let error):
                    print ("failed get logs: \(error)")
                }
            }
        } else {
            saveButton.setImage(#imageLiteral(resourceName: "loveUntapped"), for: .normal)
            roomHasSavedButton.toggle()
            guard let url = URL(string: "https://backends.xyz/api/user/saved_room/") else { return }
            
            
            let headers: HTTPHeaders = [
                "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
            ]
            let parameters: Parameters = ["room_id": pk]
            
            Alamofire.request(url, method: .delete, parameters: parameters, headers: headers).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        print(data)
                        
                    } catch {
                        print("error has caught in saveButton Look at HomesAroundtheWorldViewCell")
                    }
                    
                case .failure(let error):
                    print ("failed get logs: \(error)")
                }
            }
        }
    }
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
