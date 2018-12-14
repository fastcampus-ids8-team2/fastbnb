//
//  DetailViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UISearchBarDelegate {

    var arrayOfCellData: [Result] = []
    @IBOutlet weak var searchBarForDetailVC: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchText: String?
    var newArrayOfCellData: [Result] = []
    var emptyArrayOfCellData: [Result] = []
    

    
    
    // number from guestViewcontroller
    var adultGuestNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayOfCellData = ListingData.shared.arrayOfCellData
        searchBarForDetailVC.delegate = self

        
        
        tableView.rowHeight = 300
        
        
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchText = searchBar.text ?? ""
        
        for i in 0...arrayOfCellData.count - 1 {
            if self.searchText == arrayOfCellData[i].city {
                arrayOfCellData.append(self.arrayOfCellData[i])
        }
        
            DispatchQueue.main.async {
//                print("newArrayOfCellData: ",self.newArrayOfCellData)
                self.tableView.reloadData()
                self.searchBarForDetailVC.resignFirstResponder()
            }
        
        }
        
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

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.detailViewTableViewCell, for: indexPath) as! DetailExploreViewTableViewCell
        
        
        
        
      
        
        cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
        
        let starRandomNumber = Int.random(in: 3...5)
        
        if starRandomNumber == 3 {
            cell.numberOfStar.text = "⭐️⭐️⭐️"
        } else if starRandomNumber == 4 {
            cell.numberOfStar.text = "⭐️⭐️⭐️⭐️"
        } else if starRandomNumber == 5 {
            cell.numberOfStar.text = "⭐️⭐️⭐️⭐️⭐️"
        }
        
        let randomNumber = Int.random(in: 0...500)
        cell.numberOfReview.text = "\(randomNumber)"
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let bookingVC = storyboard?.instantiateViewController(withIdentifier: "BookingViewController") as! BookingViewController
        
        // passing data to the bookingVC
        bookingVC.data = arrayOfCellData[indexPath.row]
        
//        tableViewSelectDelegate?.indexInformation(indexPath: indexPath)
        //MARK:  네비게이션 컴트롤러가 앞에 있을 때
        navigationController?.pushViewController(bookingVC, animated: true)

        
    }
    
    
}

extension DetailViewController: SelectNumberDelegate {
    func selectNumberOfAdult(number: Int) {
        adultGuestNumber = number
        print(adultGuestNumber)
    }
    
    
}


