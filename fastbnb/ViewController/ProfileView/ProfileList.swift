//
//  ProfileItem.swift
//  fastbnb
//
//  Created by wonsik on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct ProfileList {
    var title: String
    var explain: String
    var icon: String
}


struct ProfileData {
    let list = [
        ProfileList(title: "알림", explain: "", icon: "profilebell3.png"),
        ProfileList(title: "친구를 초대하세요", explain: "", icon: "profilegiftbox.png"),
        ProfileList(title: "호스트 추천하기", explain: "", icon: "profilegiftbox.png"),
        ProfileList(title: "여행 크레딧과 쿠폰", explain: "", icon: "profileMedal2.png"),
        ProfileList(title: "결제", explain: "", icon: "profileCard.png"),
        ProfileList(title: "설정", explain: "", icon: "profileSetting.png"),
        ProfileList(title: "도움말", explain: "", icon: "profileQuestion.png"),
        ProfileList(title: "호스팅에 관해 알아보기", explain: "", icon: "profileHouse.png"),
        ProfileList(title: "숙소등록하기",explain:"", icon: "profileHouse.png"),
        ProfileList(title: "피드백 남기기",explain:"", icon: "profileCard.png"),
        ]
}
