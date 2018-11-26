//
//  SavedItemCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit




// MARK: - Class Implementation

final class SavedItemCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet private weak var itemSavedImageView: UIImageView!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var numberOfSavedCityLabel: UILabel!
    
    static let identifier: String = "savedItemCell"
    
    
    var cityName: String?
    var numberSaved: Int?
    
        
    
    // MARK: Action Handler
    
    func setupCell(cityName: String, savedImageName: String) {
        cityNameLabel.text = cityName
        itemSavedImageView.image = UIImage(named: savedImageName)
//        numberOfSavedCityLabel.text = ""
        print("cell has been setup")
        
    }
    
    func setupCell2(cityName: String, savedImageName: String, numberSaved: Int) {
        cityNameLabel.text = cityName
        itemSavedImageView.image = UIImage(named: savedImageName)
        numberOfSavedCityLabel.text = "\(numberSaved)"
    }

}
