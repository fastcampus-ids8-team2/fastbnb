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
    static let homeAroundTheWorldCellImage = "homeAroundTheWorldCellImage"
}





class ExploreViewController: UIViewController {
   
    var DummyImagee = [UIImage]()
    
    
    var pk: [Int] = []
    var bathrooms: [Int] = []
    var bedrooms: [Int] = []
    var beds: [Int] = []
    var personCapacity: [Int] = []
    var hostImages: [ String ] = []
    
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

        //
//        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableView.automaticDimension
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
                    self.hostImages.append(listing[i].hostimages.hostThumbnailURL)
                    
            }
            
            print(self.pk)
            print("hostImages:", self.hostImages)
            
            
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
        
        // home around the world cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.homesAroundTheWorldCell, for: indexPath) as! HomesAroundTheWorldTableViewCell
           
            
            return cell
        }
        
        return UITableViewCell()
    }
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // home around the world cell
        if indexPath.row == 0 {
            if let cell = cell as? HomesAroundTheWorldTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = true
                cell.collectionView.delegate = self
                
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
          
         
            return tableView.bounds.width + 20.0
          
        } else {
            return UITableView.automaticDimension
            
        }
    }
    
}


extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.homeAroundTheWorldCellImage, for: indexPath) as! HomesAroundTheWorldCollectionViewCell
        
        // Todo - get your data model...
        cell.image = DummyImagee[indexPath.item].images?.first
        cell.typeOfHome.text = "Entire"
        cell.dot.text = "•"
        cell.cityName.text = "Los Angeles"
        
        cell.homeDescription.text = "This is the most beatiful home in the southern california. Come and enjoy"
        cell.numberOfStar.text = "★★★★★"
        cell.numberOfStarLabel.text = "\(231)"
        print("Dummy Image:", DummyImagee)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 5.0
        let numberOfItemPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumInteritemSpacing) / numberOfItemPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
