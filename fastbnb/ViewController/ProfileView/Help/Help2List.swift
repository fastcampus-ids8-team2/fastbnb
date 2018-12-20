//
//  Help2List.swift
//  fastbnb
//
//  Created by wonsik on 20/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct Help2List {
    var title: String
}

struct Help2Data {
    let list = [
        Help2List(title: "자주 묻는 질문"),
        Help2List(title: "호스트가 자주 묻는 질문"),
        Help2List(title: "요금 및 예약 가능 여부"),
        Help2List(title: "예약 취소"),
        Help2List(title: "대금 수령 정보 추가"),
        ]
}
