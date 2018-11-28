//
//  ExploreViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ExploreViewController: UIViewController {
    let formatter = DateFormatter()
    
    @IBOutlet var calendarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func datesCalendarOpen(_ sender: Any) {
        self.view.addSubview(calendarView)
        calendarView.center = self.view.center
        
        
        
    }
    
    

   
}

extension ExploreViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        guard cell is CalendarCustomCell else {return}
     
        
        
    }
    
   
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 11 01")!
        let endDate = formatter.date(from: "2019 11 30")!
        
        let parameters = ConfigurationParameters(startDate: startDate
            , endDate: endDate)
        
        
        return parameters
        
    }
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCalendarCell", for: indexPath) as! CalendarCustomCell
        cell.dataLabel.text = cellState.text
        return cell
        
    }
 
}

