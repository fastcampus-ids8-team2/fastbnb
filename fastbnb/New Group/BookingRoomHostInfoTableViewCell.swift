//
//  BookingRoomHostInfoTableViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class BookingRoomHostInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var hostImageView: UIImageView!
    @IBOutlet weak var roomAddress: UILabel!
    
    func setupCell(imageName: String) {
        
        guard let url = URL(string: imageName) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.hostImageView.image = UIImage(data: data)
                self.hostImageView.layer.cornerRadius = self.hostImageView.frame.width / 2
                self.hostImageView.layer.masksToBounds = true
            }
        }.resume()
        
    }
}
