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





class ExploreViewController: UIViewController {
   
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
        listingAPIFetch { num in
            print(num)
        }
        
        print("pk:",pk)
        
        
        //
    }
    
    @IBAction func datesCalendarOpen(_ sender: Any) {
        self.view.addSubview(calendarView)
        calendarView.center = self.view.center
        
        
        
    }
    
    
    
    private func listingAPIFetch(with completionHandler: @escaping ([Int]) -> Void) {
        guard let url = URL(string: "https://backends.xyz/api/home/listings/") else { return }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            guard let listing = try? JSONDecoder().decode(Welcome.self, from: data) else { return }

          
                for i in 0...(listing.count - 1) {
                    self.bathrooms.append(listing[i].bathrooms)
                    self.pk.append(listing[i].pk)
            }
            
            print(self.pk)
            completionHandler(self.pk)
            
            
            
            
            
        }
        task.resume()
    }
    
 
}

// extension start from here
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

