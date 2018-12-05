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
    var arrayOfCellData: Listing = []
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var calendarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCellData = ListingData.shared.arrayOfCellData

        
        }
    
//        self.tableView.estimatedRowHeight = self.tableView.rowHeight
//        self.tableView.rowHeight = UITableView.automaticDimension
    }



    // Calendar View

//    @IBAction func datesCalendarOpen(_ sender: Any) {
//        self.view.addSubview(calendarView)
//        calendarView.center = self.view.center
//
//
//
//    }

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
                cell.collectionView.isScrollEnabled = false
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
        return 4    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.homeAroundTheWorldCellImage, for: indexPath) as! HomesAroundTheWorldCollectionViewCell
        
        // Todo - get your data model...
        
        
        if indexPath.row < 4 {
            
            cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roominfo.roomPhoto1)
        }
        cell.dot.text = "•"
        cell.numberOfStar.text = "★★★★★"
        cell.numberOfStarLabel.text = "\(Int.random(in: 0 ..< 500))"

        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item,"this has been tapped")
        
     
        
   
        // delegate?.didSelectRoom(data)
    }
}


// func didSelectRoom(data) {
//    // performSegue()
//    // vc.data = data
// }

