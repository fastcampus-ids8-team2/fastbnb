//
//  saveViewItemCell.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

final class ItemCell: UITableViewCell {
    @IBOutlet private weak var savedImage: UIImageView!
    @IBOutlet private weak var citiName: UILabel!
    @IBOutlet private weak var numberOfHouseSaved: UILabel!
    
    static let identifier: String = "ItemCell"
    
    var citiNameString: String?
    var numberOfHouseSavedString: String?
    
    
}





//final class ItemCell: UITableViewCell {
//

//    func setupCell(productName: String, imageName: String, minimumPrice: String) {
//        productNameLabel.text = productName
//        minimumPriceLabel.text = minimumPrice
//        guard let imageUrl = URL(string: imageName) else { return }
//        //        if let data = try? Data(contentsOf: imageUrl)
//        //        {
//        //            itemImageView.image = UIImage(data: data)
//        //
//        //
//        //        }
//        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
//            guard error == nil else { return }
//            guard let data = data else { return }
//            DispatchQueue.main.async {
//                self.itemImageView.image = UIImage(data: data)
//            }
//
//
//        }
//        task.resume()
//
//    }
//
//
//}
