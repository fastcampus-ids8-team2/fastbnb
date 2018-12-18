//
//  HelpList.swift
//  fastbnb
//
//  Created by wonsik on 18/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct HelpList {
    var title: String
}

struct HelpData {
    let list = [
        HelpList(title: "자주 묻는 질문"),
        HelpList(title: "호스트가 자주 묻는 질문"),
        HelpList(title: "요금 및 예약 가능 여부"),
        HelpList(title: "예약 취소"),
        HelpList(title: "대금 수령 정보 추가"),
        ]
}
