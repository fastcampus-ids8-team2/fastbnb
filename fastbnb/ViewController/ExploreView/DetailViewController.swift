//
//  DetailViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var arrayOfCellData: Listing = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCellData = ListingData.shared.arrayOfCellData
        arrayOfCellData.reverse()
        
        
        
        tableView.rowHeight = 300
        
        
        
    }
    


 

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.detailViewTableViewCell, for: indexPath) as! DetailExploreViewTableViewCell
        
        
        
        
      
        
        
        cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roominfo.roomPhoto1)
        
       
        cell.numberOfStar.text = "★★★★★"
        cell.numberOfReview.text = "\(Int.random(in: 1 ..< 500))"
        
        
        
        return cell
    }
    
    
}


