//
//  IncomeList.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import Foundation

struct IncomeList {
    var title: String
    var explain: String
}


struct IncomeData {
    let list = [
        IncomeList(title: "￦0", explain: "지급 완료"),
        IncomeList(title: "￦422,775", explain: "잠재 수입"),
    ]
}
