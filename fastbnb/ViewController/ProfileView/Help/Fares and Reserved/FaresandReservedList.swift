//
//  FaresandReservedList.swift
//  fastbnb
//
//  Created by wonsik on 18/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct FaresandReservedList {
    var title: String
}

struct FaresandReservedData {
    let list = [
        FaresandReservedList(title: "특정 날짜 요금은 어떻게 설정하나요?"),
        FaresandReservedList(title: "특정 게스트만 예약할 수 있도록 어떻게 하나요?"),
        FaresandReservedList(title: "제 숙소가 왜 비활성화되었나요?"),
        FaresandReservedList(title: "게스트가 내 숙소를 볼 수 있는지 확인할 수 있나요?"),
        FaresandReservedList(title: "숙박 요금은 어떻게 결정하나요"),
        FaresandReservedList(title: "청소비는 어떻게 추가하나요?"),
        FaresandReservedList(title: "예약 시 게스트로부터 수수료를 수금할 수 있나요?"),
        FaresandReservedList(title: "즉시 예약을 허용하는 호스트에게 페널티 없는 취소가 적용되나요?"),
        FaresandReservedList(title: "숙소 정보는 어떻게 수정하나요?"),
        FaresandReservedList(title: "게스트가 체크인할 수 없는 요일을 설정할수 있나요?")
        
    ]
}
