//
//  SettingList.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct SettingsList {
    var title: String
}

struct SettingData {
    let list = [
        SettingsList(title: "알림"),
        SettingsList(title: "통화 단위"),
        SettingsList(title: "대금 수령 방법"),
        SettingsList(title: "서비스 약관"),
        SettingsList(title: "버전:18.47 (200495)"),
        SettingsList(title: "로그아웃")
    ]
}
