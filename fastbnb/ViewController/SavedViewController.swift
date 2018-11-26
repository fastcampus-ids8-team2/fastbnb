//
//  SavedViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import AloeStackView


class SavedViewController: UIViewController {

    let titleForSavedView = "Saved"
    let aloeStackView = AloeStackView()
    private var cityNames : [String] = []
    private var cityImage : [String] = []
    private var numberOfCitySaved: [Int] = []
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
       
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        cityNames.append("London")
        cityImage.append("airbnbImage")
        
   
        
        
    }
    
 

}

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemCell.identifier, for: indexPath) as! SavedItemCell
        
        if numberOfCitySaved.count > 0 {
            cell.setupCell2(cityName: cityNames[indexPath.row], savedImageName: cityImage[indexPath.row], numberSaved: numberOfCitySaved[indexPath.row])
        } else {
        
            cell.setupCell(cityName: cityNames[indexPath.row], savedImageName: cityImage[indexPath.row])
            
        
        }
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return titleForSavedView
        
    }
    
    
}
