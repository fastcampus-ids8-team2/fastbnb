//
//  CalenderViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 27/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FSCalendar


class CalenderViewController: UIViewController {
    let formatter = DateFormatter()

    
    override func viewDidLoad() {
        
    }

}


extension CalenderViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let dateString = dateFormatter.string(from: date)
        print(dateString)
    }
}
