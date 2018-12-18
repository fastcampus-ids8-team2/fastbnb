//
//  SavedInformation.swift
//  fastbnb
//
//  Created by WooJun Kim on 07/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation
import Alamofire

typealias SavedRooms = [SavedRoom]

struct SavedRoom: Codable {
    let pk, bathrooms, bedrooms, beds: Int
    let personCapacity: Int
    let roomName, roomType, roomAndPropertyType, publicAddress: String
    let city: String
    let price: Int
    let lat, lng: Double
    let roomInfo1, roomInfo2, roomInfo3, roomInfo4: String
    let createdAt: String
    let amenities: [String]
    let hostimages: SavedRoomHostimages
    let roomPhotos: [SavedRoomRoomPhoto]
    
    enum CodingKeys: String, CodingKey {
        case pk, bathrooms, bedrooms, beds
        case personCapacity = "person_capacity"
        case roomName = "room_name"
        case roomType = "room_type"
        case roomAndPropertyType = "room_and_property_type"
        case publicAddress = "public_address"
        case city, price, lat, lng
        case roomInfo1 = "room_info_1"
        case roomInfo2 = "room_info_2"
        case roomInfo3 = "room_info_3"
        case roomInfo4 = "room_info_4"
        case createdAt = "created_at"
        case amenities, hostimages
        case roomPhotos = "room_photos"
    }
}

struct SavedRoomHostimages: Codable {
    let hostThumbnailURL, hostThumbnailURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case hostThumbnailURL = "host_thumbnail_url"
        case hostThumbnailURLSmall = "host_thumbnail_url_small"
    }
}

struct SavedRoomRoomPhoto: Codable {
    let roomPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case roomPhoto = "room_photo"
    }
}

class SavedRoomData {
    static let shared = SavedRoomData()
    var arrayOfData: SavedRooms = []
    var selectRow: Int = 0
    
    func getDataFromServer() {
        guard let url = URL(string: "https://backends.xyz/api/user/saved/") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
        ]
        
        Alamofire.request(url, method: .get, headers: headers).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let savedRoomData = try JSONDecoder().decode(SavedRooms.self, from: data)
                    self.arrayOfData = savedRoomData
                } catch {
                    print("[[\(error.localizedDescription)]]")
                    self.arrayOfData = []
                }
                
            case .failure(let error):
                print ("failed get logs: \(error)")
            }
            
            
        }
    }
}
