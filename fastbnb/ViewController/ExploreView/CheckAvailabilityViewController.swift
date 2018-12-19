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
        guard let bookingViewVC = storyboard?.instantiateViewController(withIdentifier: "BookingViewController") as? BookingViewController else { return }
        checkAvailabilityDateDelegate?.savedDate(dates: bookingSavedDate)
        

//        bookinViewVC.checkAvailability.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        
    }
    
    
}

extension CheckAvailabilityViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "YYYY-MM-dd"
        let dateString = dataFormatter.string(from: date)
        bookingSavedDate.append(dateString)
        print(bookingSavedDate)
//        if initialBookingSavedDate.count == 0 {
//            bookingSavedDate == initialBookingSavedDate
//        } else {
//        bookingSavedDate = initialBookingSavedDate.filter{ $0 != dateString }
//        }
      
        
    }
    
    
    
    
}
