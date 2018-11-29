//
//  HostInformation.swift
//  fastbnb
//
//  Created by Isaac Kim on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

typealias Welcome = [WelcomeElement]

struct WelcomeElement: Codable {
    let pk, bathrooms, bedrooms, beds: Int
    let personCapacity: Int
    let roomName: String
    let roomType: RoomType
    let roomAndPropertyType, publicAddress, city: String
    let price: Int
    let lat, lng: Double
    let createdAt: String
    let amenities: [String]
    let roominfo: Roominfo
    let hostimages: Hostimages
    
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
    }
}

struct Hostimages: Codable {
    let hostThumbnailURL, hostThumbnailURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case hostThumbnailURL = "host_thumbnail_url"
        case hostThumbnailURLSmall = "host_thumbnail_url_small"
    }
}

enum RoomType: String, Codable {
    case 개인실 = "개인실"
    case 집전체 = "집 전체"
}

struct Roominfo: Codable {
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
