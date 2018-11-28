//
//  HomesAroundTheWorldCollectionViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 28/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class HomesAroundTheWorldCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
            
        }
    }
}
