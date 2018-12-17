//
//  ExploreViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit





class ExploreViewController: UIViewController, UISearchBarDelegate {
   
    @IBOutlet weak var datesButtonOutlet: UIButton!
    @IBOutlet weak var guestButtonOutlet: UIButton!
    
    var arrayOfCellData: [Result] = []
    var newArrayOfCellData: [Result] = []
    var searchText: String?
    var adultGuestNumber = 0
    
    var cityArray = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var calendarView: UIView!
    
    
    @IBOutlet weak var citySearchSliderBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchSliderBar.delegate = self
        arrayOfCellData = ListingData.shared.arrayOfCellData
        cityArray = [1,2,3,4,5]
        setButton()
        
        
        }
    
    private func setButton() {
        datesButtonOutlet.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        datesButtonOutlet.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        datesButtonOutlet.layer.borderWidth = 1
        datesButtonOutlet.layer.cornerRadius = 5
        datesButtonOutlet.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        guestButtonOutlet.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        guestButtonOutlet.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        guestButtonOutlet.layer.borderWidth = 1
        guestButtonOutlet.layer.cornerRadius = 5
        guestButtonOutlet.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        citySearchSliderBar.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        newArrayOfCellData = []
        self.searchText = searchBar.text ?? ""
        for i in 0..<arrayOfCellData.count {
            if self.searchText == arrayOfCellData[i].city {
                newArrayOfCellData.append(self.arrayOfCellData[i])
                print("print City:", arrayOfCellData[i].city)
                print("Hello")
            }
        }
        
     
        
//        print("adultGuestNumber: ", adultGuestNumber)
        print("searchText:",searchText)
        print("arrayOfCellData: ",newArrayOfCellData.count)
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
        
        if cityArray[indexPath.row] == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.homesAroundTheWorldCell, for: indexPath) as! HomesAroundTheWorldTableViewCell
            cell.homesAroundTheWorld.text = "Homes In Korea"
            cell.showAll.layer.borderWidth = 1
            cell.showAll.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
           
            
            return cell
        }
        
        return UITableViewCell()
    }
  
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // home around the world cell
        let cell = cell as? HomesAroundTheWorldTableViewCell
        cell?.collectionView.dataSource = self
        cell?.collectionView.delegate = self
        
        
        if cityArray[indexPath.row] == 1 {
//            if let cell = cell as? HomesAroundTheWorldTableViewCell {
            
//                cell.collectionView.dataSource = self
            cell!.collectionView.reloadData()
            cell!.collectionView.isScrollEnabled = true
//                cell.collectionView.delegate = self
                
                
        } else if cityArray[indexPath.row] == 2 {
//            if let cell = cell as? HomesAroundTheWorldTableViewCell {
//                cell.collectionView.dataSource = self
            cell!.collectionView.reloadData()
            cell!.collectionView.isScrollEnabled = false
//                cell.collectionView.delegate = self
                
                
            }
            
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
          
         
            return tableView.bounds.width + 115
          
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
        
        
//        if cityArray[indexPath.row] == 1 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.homeAroundTheWorldCellImage, for: indexPath) as! HomesAroundTheWorldCollectionViewCell
        
        // Todo - get your data model...
        
        

        if newArrayOfCellData.count == 0 {
            cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
        } else if newArrayOfCellData.count > 0 {
            cell.setupCell(homeType: newArrayOfCellData[indexPath.row].roomType.rawValue,
                           city: newArrayOfCellData[indexPath.row].city,
                           roomPriceInfo: newArrayOfCellData[indexPath.row].price,
                           roomTitle: newArrayOfCellData[indexPath.row].roomName,
                           image: newArrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
        } else if newArrayOfCellData.count == 0 && searchText?.isEmpty == false {
            cell.setupCell(homeType: newArrayOfCellData[indexPath.row].roomType.rawValue,
                           city: newArrayOfCellData[indexPath.row].city,
                           roomPriceInfo: newArrayOfCellData[indexPath.row].price,
                           roomTitle: newArrayOfCellData[indexPath.row].roomName,
                           image: newArrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
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
