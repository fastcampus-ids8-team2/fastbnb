//
//  TripItemCell.swift
//  fastbnb
//
//  Created by WooJun Kim on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - Class Implementation

final class TripItemCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    static let identifier: String = "tripItemCell"
}
