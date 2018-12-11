//
//  BookingRoomHostInfoTableViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 11/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class BookingRoomHostInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var hostImage: UIImageView!
    @IBOutlet weak var roomTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
