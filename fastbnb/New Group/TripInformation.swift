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

typealias TripRooms = [TripElement]

struct TripElement: Codable {
    let id, room, guest, numGuest: Int
    let checkInDate, checkOutDate: String
    let reservedDates: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, room, guest
        case numGuest = "num_guest"
        case checkInDate = "check_in_date"
        case checkOutDate = "check_out_date"
        case reservedDates = "reserved_dates"
    }
}


final class TripRoomData {
    static let shared = TripRoomData()
    var arrayOfData: TripRooms = []
    var selectRow: Int = 0
    
    func getDataFromServer() {
        guard let url = URL(string: "https://backends.xyz/api/home/booking/") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer 59efca27a9ce387ae5b042e70a6677b7cf508f63"
        ]
        
        Alamofire.request(url, method: .get, headers: headers).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                do {
                    let tripRoomData = try JSONDecoder().decode(TripRooms.self, from: data)
                    self.arrayOfData = tripRoomData
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
