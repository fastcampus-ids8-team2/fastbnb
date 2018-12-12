//
//  FeedbackList.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct FeedbackList {
    var title: String
    var icon: String
}

struct FeedbackData {
    let list = [
    FeedbackList(title: "제품 피드백 제출하기", icon: "profilegiftbox.png"),
    FeedbackList(title: "버그 신고", icon: "profilegiftbox.png")
    ]
}
