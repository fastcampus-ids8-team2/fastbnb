//
//  ExploreViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import JTAppleCalendar




class ExploreViewController: UIViewController, UISearchBarDelegate {
   
    
    @IBOutlet weak var guestButton: UIButton!
    var arrayOfCellData: [Result] = []
    var newArrayOfCellData: [Result] = []
    var searchText: String?
    var adultGuestNumber = 0
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var calendarView: UIView!
    
    
    @IBOutlet weak var citySearchSliderBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchSliderBar.delegate = self
        arrayOfCellData = ListingData.shared.arrayOfCellData

        
       
        

        
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchText = searchBar.text ?? ""
        
        for i in 0...arrayOfCellData.count - 1 {
            if (self.searchText?.contains(arrayOfCellData[i].city))! && adultGuestNumber >= arrayOfCellData[i].personCapacity {
                newArrayOfCellData.append(self.arrayOfCellData[i])
            }
            
            
        }
        print("adultGuestNumber: ", adultGuestNumber)
        print("newArrayOfCellData: ",newArrayOfCellData)
        tableView.reloadData()
        citySearchSliderBar.resignFirstResponder()
    }
    
    // guest number select method
    @IBAction func didTapGestViewController(_ sender: UIButton) {
        let guestViewVC = storyboard?.instantiateViewController(withIdentifier: "guestViewController") as! GuestViewController
        guestViewVC.guestViewDelegate = self
        present(guestViewVC, animated: true, completion: nil)
        
    }
    
    @IBAction func didTapCalendarViewController(_ sender: UIButton) {
        let calendarViewVC = storyboard?.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        
        present(calendarViewVC, animated: true, completion: nil)
        
    }
    
    @IBAction func unwindToDetailViewController(_ unwindSegue: UIStoryboardSegue) {
        
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
                cell.collectionView.isScrollEnabled = false
                cell.collectionView.delegate = self
                
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
          
         
            return tableView.bounds.width + 32.5
          
        } else {
            return UITableView.automaticDimension
            
        }
    }
    


}




extension ExploreViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if newArrayOfCellData.count == 0 {
            return arrayOfCellData.count
        } else {
            return newArrayOfCellData.count
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.homeAroundTheWorldCellImage, for: indexPath) as! HomesAroundTheWorldCollectionViewCell
        
        // Todo - get your data model...
        
        
        if  newArrayOfCellData.count == 0 {
            
            cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
            
            } else if  newArrayOfCellData.count > 0 {
            cell.setupCell(homeType: newArrayOfCellData[indexPath.row].roomType.rawValue,
                           city: newArrayOfCellData[indexPath.row].city,
                           roomPriceInfo: newArrayOfCellData[indexPath.row].price,
                           roomTitle: newArrayOfCellData[indexPath.row].roomName,
                           image: newArrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
            
            
            
            newArrayOfCellData.removeAll()
            
            
        }
        cell.dot.text = "•"
        
        let starRandomNumber = Int.random(in: 3...5)
        
        if starRandomNumber == 3 {
            cell.numberOfStar.text = "⭐️⭐️⭐️"
        } else if starRandomNumber == 4 {
            cell.numberOfStar.text = "⭐️⭐️⭐️⭐️"
        } else if starRandomNumber == 5 {
            cell.numberOfStar.text = "⭐️⭐️⭐️⭐️⭐️"
        }
        
        cell.numberOfStarLabel.text = "\(Int.random(in: 0 ..< 500))"
        cell.pk = arrayOfCellData[indexPath.row].pk
        
        
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
        
        
        let bookingVC = storyboard?.instantiateViewController(withIdentifier: "BookingViewController") as! BookingViewController
        
        bookingVC.data = arrayOfCellData[indexPath.row]
        
        //MARK:  네비게이션 컴트롤러가 앞에 있을 때
        navigationController?.pushViewController(bookingVC, animated: true)
    
    }
    
}

extension ExploreViewController: SelectNumberDelegate {
    func selectNumberOfAdult(number: Int) {
        adultGuestNumber = number
        print(adultGuestNumber)
    }

    
}
