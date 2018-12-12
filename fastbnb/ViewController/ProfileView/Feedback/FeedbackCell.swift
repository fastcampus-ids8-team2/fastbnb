//
//  FeedbackCell.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class FeedbackCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
