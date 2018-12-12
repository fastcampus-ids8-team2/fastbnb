//
//  NotificationList.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct NotificationList {
    var title: String
}

struct NotificationData {
    let list = [
    NotificationList( title: "메세지"),
    NotificationList( title: "이메일"),
    NotificationList( title: "문자 메세지")
        ]
}
