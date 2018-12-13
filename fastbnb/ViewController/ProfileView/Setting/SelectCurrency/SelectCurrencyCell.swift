//
//  SelectCurrencyCell.swift
//  fastbnb
//
//  Created by wonsik on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class SelectCurrencyCell: UITableViewCell {

    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
