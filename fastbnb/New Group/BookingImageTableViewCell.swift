//
//  BookingImageTableViewCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 11/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class BookingImageTableViewCell: UITableViewCell {
   
    @IBOutlet weak var mainImage: UIImageView!
    
  
    
    func setupCell(image: String) {
        
 
        guard let imageUrl = URL(string: image) else { return }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
            }
            
            
        }
        task.resume()
        
    }
    
}
