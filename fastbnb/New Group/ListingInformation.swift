//
//  HostInformation.swift
//  fastbnb
//
//  Created by Isaac Kim on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation
import UIKit

struct FakeNumber {
    static var countNumber = FakeNumber()
    var realNumber = false
    
    
}

struct Listing: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [Result]
}

struct Result: Codable {
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
    let roomHost: RoomHost
    
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
        case roomHost = "room_host"
    }
}

struct Hostimages: Codable {
    let hostThumbnailURL, hostThumbnailURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case hostThumbnailURL = "host_thumbnail_url"
        case hostThumbnailURLSmall = "host_thumbnail_url_small"
    }
}

struct RoomHost: Codable {
    let pk: Int
    let firstName: FirstName
    let lastName: LastName
    let isHost: Bool
    let hostIntroduction, imgProfile: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case pk
        case firstName = "first_name"
        case lastName = "last_name"
        case isHost = "is_host"
        case hostIntroduction = "host_introduction"
        case imgProfile = "img_profile"
    }
}

enum FirstName: String, Codable {
    case gosu = "gosu"
}

enum LastName: String, Codable {
    case cho = "cho"
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

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}



final class ListingData {
        static let shared = ListingData()
        var arrayOfCellData: [Result] = []
        var nextPageURL: String? = ""
    
    

    
    func getDataFromServer() { // 서버에서 데이터 가져오는 펑션
        
            guard let url = URL(string: "https://backends.xyz/api/home/listings/") else { return }
            guard let data = try? Data(contentsOf: url) else { return }
        
            guard let listingData = try? JSONDecoder().decode(Listing.self, from: data) else { return }
            arrayOfCellData = listingData.results
            nextPageURL = listingData.next
    
            print("\n===============[data received]========================\n")
            print("Data recevied complete")
        
    }

    func getNextPageDataFromServer(_ collectionView: UICollectionView) {
            // 데이터 페이지네이션 대응 펑션(스크롤 끝에서 데이터 추가받고 리로드 데이터)
            guard let url = URL(string: nextPageURL ?? "") else
            {
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                let jsonDecoder = JSONDecoder()
                
                do {
                    let arrayData = try jsonDecoder.decode(Listing.self, from: data)
                    
                    for i in 0..<arrayData.results.count {
                        self.arrayOfCellData.append(arrayData.results[i])
                    }
                    self.nextPageURL = arrayData.next
                    DispatchQueue.main.async {
                        collectionView.reloadData()
                    }
                } catch {
                    print("에러내용: \(error)")
                }}.resume()
        }
    
}


