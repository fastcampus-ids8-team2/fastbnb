//
//  ExploreViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import JTAppleCalendar


struct Storyboard {
   
    static let homesAroundTheWorldCell = "homesAroundTheWorldCell"
    static let newIdentificer = "newIdentifier"
}

//struct ListingInfo {
//    var pk: [Int] = []
//    var bathrooms: [Int] = []
//    var bedrooms: [Int] = []
//    var beds: [Int] = []
//    var personCapacity: [Int] = []
//
//
//
//}




class ExploreViewController: UIViewController {
    let formatter = DateFormatter()
    var DummyImagee = [UIImage]()
    
    
    var pk: [Int] = []
    var bathrooms: [Int] = []
    var bedrooms: [Int] = []
    var beds: [Int] = []
    var personCapacity: [Int] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var calendarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data1 = UIImage(named: "airbnbImage")
        let data2 = UIImage(named: "airbnbImage")
        let data3 = UIImage(named: "airbnbImage")
        let data4 = UIImage(named: "airbnbImage")
        let data5 = UIImage(named: "airbnbImage")
        let data6 = UIImage(named: "airbnbImage")
        let data7 = UIImage(named: "airbnbImage")
        let data8 = UIImage(named: "airbnbImage")
        DummyImagee.append(data1!)
        DummyImagee.append(data2!)
        DummyImagee.append(data3!)
        DummyImagee.append(data4!)
        DummyImagee.append(data5!)
        DummyImagee.append(data6!)
        DummyImagee.append(data7!)
        DummyImagee.append(data8!)
        
        
        
        print("Dummy Images", DummyImagee)
        listingAPIFetch()
        
    }
    
    @IBAction func datesCalendarOpen(_ sender: Any) {
        self.view.addSubview(calendarView)
        calendarView.center = self.view.center
        
        
        
    }
    
    
    
    private func listingAPIFetch() {
        guard let url = URL(string: "https://backends.xyz/api/home/listings/") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            guard let listing = try? JSONDecoder().decode(Welcome.self, from: data) else { return }
//            guard let listingInfo = listing as? [String : Any] else { return }
            print("item listing", listing)
          
            DispatchQueue.main.async {
                for i in 0...(listing.count) {
                    listing[i].bathrooms
                    
                    
                    
                }
                
            }
            
            
            
        }
        task.resume()
    }
    
 
}

// extension start from here
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



// tableView Controller setting
extension ExploreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.homesAroundTheWorldCell, for: indexPath) as! HomesAroundTheWorldTableViewCell
           
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
    
}

