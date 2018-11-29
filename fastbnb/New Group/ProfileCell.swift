//
//  ProfileCell.swift
//  fastbnb
//
//  Created by wonsik on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
final class ProfileCell: UITableViewCell{
    
    
    @IBOutlet weak var ProfileIconImage: UIImageView!
    
    @IBOutlet weak var ProfileTitleLabel: UILabel!
    
    @IBOutlet weak var ProfileExplanationLabel: UILabel!
 
    static let identifier: String = "ProfileCell"
    
    func setupCell(title: String, imageName: String) {
        ProfileTitleLabel.text = title
//        ProfileExplanationLabel.text = explanation
        ProfileIconImage.image = UIImage(named: imageName)
        
    }
    
    
}

