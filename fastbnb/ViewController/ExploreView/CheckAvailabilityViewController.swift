//
//  CheckAvailabilityViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 14/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import FSCalendar

protocol SavedDateDelegate: class {
    func savedDate(dates: [String])
}

class CheckAvailabilityViewController: UIViewController {
    
    var bookingSavedDate: [String] = []
    var initialBookingSavedDate: [String] = []
    var checkAvailabilityDateDelegate: SavedDateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }
    @IBAction func didTapSaveButton(_ sender: Any) {

        checkAvailabilityDateDelegate?.savedDate(dates: bookingSavedDate)
        

        
    }
    
    
}

extension CheckAvailabilityViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "YYYY-MM-dd"
        let dateString = dataFormatter.string(from: date)
        bookingSavedDate.append(dateString)
        print(bookingSavedDate)

        
    }
    
    
    
    
}
