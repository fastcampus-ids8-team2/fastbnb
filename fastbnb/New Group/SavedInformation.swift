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
    let createdAt: String
    let amenities: [String]
    let roominfo: SavedRoominfo
    let hostimages: SavedHostimages
    let bookingInfo: [SavedBookingInfo]
    
    enum CodingKeys: String, CodingKey {
        case pk, bathrooms, bedrooms, beds
        case personCapacity = "person_capacity"
        case roomName = "room_name"
        case roomType = "room_type"
        case roomAndPropertyType = "room_and_property_type"
        case publicAddress = "public_address"
        case city, price, lat, lng
        case createdAt = "created_at"
        case amenities, roominfo, hostimages
        case bookingInfo = "booking_info"
    }
}

struct SavedBookingInfo: Codable {
    let id, room, guest, numGuest: Int
    let checkInDate, checkOutDate: String
    let reservedDates: [SavedReservedDate]
    
    enum CodingKeys: String, CodingKey {
        case id, room, guest
        case numGuest = "num_guest"
        case checkInDate = "check_in_date"
        case checkOutDate = "check_out_date"
        case reservedDates = "reserved_dates"
    }
}

struct SavedReservedDate: Codable {
    let reservedDate: String
    
    enum CodingKeys: String, CodingKey {
        case reservedDate = "reserved_date"
    }
}

struct SavedHostimages: Codable {
    let hostThumbnailURL, hostThumbnailURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case hostThumbnailURL = "host_thumbnail_url"
        case hostThumbnailURLSmall = "host_thumbnail_url_small"
    }
}

struct SavedRoominfo: Codable {
    let roomInfo1, roomInfo2, roomInfo3, roomInfo4: String
    let roomPhoto1, roomPhoto2, roomPhoto3, roomPhoto4: String
    let roomPhoto5: String
    
    enum CodingKeys: String, CodingKey {
        case roomInfo1 = "room_info_1"
        case roomInfo2 = "room_info_2"
        case roomInfo3 = "room_info_3"
        case roomInfo4 = "room_info_4"
        case roomPhoto1 = "room_photo_1"
        case roomPhoto2 = "room_photo_2"
        case roomPhoto3 = "room_photo_3"
        case roomPhoto4 = "room_photo_4"
        case roomPhoto5 = "room_photo_5"
    }
}

final class SavedRoomData {
    static let shared = SavedRoomData()
    var arrayOfData: SavedRooms = []
    
    func getDataFromServer() {
        guard let url = URL(string: "https://backends.xyz/api/user/saved/") else { return }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer c02dcc25e4abeef0f2500302b02e647155222f79"
        ]
        
        Alamofire.request(url, method: .get, headers: headers).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let savedRoomData = try! JSONDecoder().decode(SavedRooms.self, from: data)
                self.arrayOfData = savedRoomData
            case .failure(let error):
                print ("failed get logs: \(error)")
            }
            
            
        }
    }
}
