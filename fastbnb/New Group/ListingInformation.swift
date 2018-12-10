//
//  HostInformation.swift
//  fastbnb
//
//  Created by Isaac Kim on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

//typealias Listing = [ListingElement]
//
//struct ListingElement: Codable {
//    let pk, bathrooms, bedrooms, beds: Int
//    let personCapacity: Int
//    let roomName: String
//    let roomType: RoomType
//    let roomAndPropertyType, publicAddress, city: String
//    let price: Int
//    let lat, lng: Double
//    let roomInfo1, roomInfo2, roomInfo3, roomInfo4: String
//    let createdAt: String
//    let amenities: [String]
//    let hostimages: Hostimages
//    let roomPhoto: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case pk, bathrooms, bedrooms, beds
//        case personCapacity = "person_capacity"
//        case roomName = "room_name"
//        case roomType = "room_type"
//        case roomAndPropertyType = "room_and_property_type"
//        case publicAddress = "public_address"
//        case city, price, lat, lng
//        case roomInfo1 = "room_info_1"
//        case roomInfo2 = "room_info_2"
//        case roomInfo3 = "room_info_3"
//        case roomInfo4 = "room_info_4"
//        case createdAt = "created_at"
//        case amenities, hostimages
//        case roomPhoto = "room_photo"
//    }
//}
//
//struct Hostimages: Codable {
//    let hostThumbnailURL, hostThumbnailURLSmall: String
//
//    enum CodingKeys: String, CodingKey {
//        case hostThumbnailURL = "host_thumbnail_url"
//        case hostThumbnailURLSmall = "host_thumbnail_url_small"
//    }
//}
//
//enum RoomType: String, Codable {
//    case 개인실 = "개인실"
//    case 집전체 = "집 전체"
//}

typealias Listing = [ListingElement]

struct ListingElement: Codable {
    let pk, bathrooms, bedrooms, beds: Int
    let personCapacity: Int
    let roomName: String
    let roomType: RoomType
    let roomAndPropertyType, publicAddress, city: String
    let price: Int
    let lat, lng: Double
    let roomInfo1, roomInfo2, roomInfo3, roomInfo4: String
    let createdAt: String
    let amenities: [String]
    let hostimages: Hostimages
    let roomPhotos: [RoomPhoto]
    
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

struct Hostimages: Codable {
    let hostThumbnailURL, hostThumbnailURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case hostThumbnailURL = "host_thumbnail_url"
        case hostThumbnailURLSmall = "host_thumbnail_url_small"
    }
}

struct RoomPhoto: Codable {
    let roomPhoto: String
    
    enum CodingKeys: String, CodingKey {
        case roomPhoto = "room_photo"
    }
}

enum RoomType: String, Codable {
    case 개인실 = "개인실"
    case 집전체 = "집 전체"
}

final class ListingData {
    static let shared = ListingData()
    var arrayOfCellData: Listing = []
    
    func getDataFromServer() { // 서버에서 데이터 가져오는 펑션
        
        guard let url = URL(string: "https://backends.xyz/api/home/listings/") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        guard let listingData = try? JSONDecoder().decode(Listing.self, from: data) else { return }
        arrayOfCellData = listingData
    

        
        
    }
    
}
