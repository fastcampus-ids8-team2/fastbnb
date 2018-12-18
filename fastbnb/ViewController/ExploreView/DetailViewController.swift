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
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet private weak var datesButton: UIButton!
    
    var searchText: String?
    var newArrayOfCellData: [Result] = []
    var emptyArrayOfCellData: [Result] = []
    

    
    
    // number from guestViewcontroller
    var adultGuestNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        arrayOfCellData = ListingData.shared.arrayOfCellData
        searchBarForDetailVC.delegate = self

        
        
        tableView.rowHeight = 300
        setButton()
        
        
    }
    
    // setting Button below search Bar
    private func setButton() {
        datesButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        datesButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        datesButton.layer.borderWidth = 1
        datesButton.layer.cornerRadius = 5
        datesButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        guestButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        guestButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        guestButton.layer.borderWidth = 1
        guestButton.layer.cornerRadius = 5
        guestButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        searchBarOutlet.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchText = searchBar.text ?? ""
        newArrayOfCellData = []
        arrayOfCellData = ListingData.shared.arrayOfCellData
        
        
        for i in 0...arrayOfCellData.count - 1 {
            if self.searchText == arrayOfCellData[i].city {
                newArrayOfCellData.append(self.arrayOfCellData[i])
        }
        
            DispatchQueue.main.async {
//                print("newArrayOfCellData: ",self.newArrayOfCellData)
                self.tableView.reloadData()
                self.searchBarForDetailVC.resignFirstResponder()
//                print(self.arrayOfCellData)
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
        if newArrayOfCellData.count == 0 {
            return arrayOfCellData.count
            
        } else {
            return newArrayOfCellData.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.detailViewTableViewCell, for: indexPath) as! DetailExploreViewTableViewCell
        
        
        
        
      
        if newArrayOfCellData.count == 0 {
            cell.setupCell(homeType: arrayOfCellData[indexPath.row].roomType.rawValue,
                           city: arrayOfCellData[indexPath.row].city,
                           roomPriceInfo: arrayOfCellData[indexPath.row].price,
                           roomTitle: arrayOfCellData[indexPath.row].roomName,
                           image: arrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)   
             cell.pk = arrayOfCellData[indexPath.row].pk
        } else if newArrayOfCellData.count > 0 {
            cell.setupCell(homeType: newArrayOfCellData[indexPath.row].roomType.rawValue,
                           city: newArrayOfCellData[indexPath.row].city,
                           roomPriceInfo: newArrayOfCellData[indexPath.row].price,
                           roomTitle: newArrayOfCellData[indexPath.row].roomName,
                           image: newArrayOfCellData[indexPath.row].roomPhotos[0].roomPhoto)
            
            print("newarrayNum:", newArrayOfCellData.count)
             cell.pk = newArrayOfCellData[indexPath.row].pk
        }
        
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


