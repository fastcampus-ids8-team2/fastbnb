//
//  PaymentList.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct PaymentList {
    var icon: String
    var title: String
    
}


struct PaymentData {
    let list = [
    PaymentList(icon: "profileCard.png", title: "신용카드나 직불카드")
    ]
}
