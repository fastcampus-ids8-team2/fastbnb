//
//  SavedItemCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Kingfisher



// MARK: - Class Implementation

final class SavedItemCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    static let identifier: String = "savedItemCell"
}
