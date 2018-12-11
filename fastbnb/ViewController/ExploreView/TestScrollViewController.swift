//
//  TestScrollViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 07/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

struct recommendMenu {
    var image = UIImage()
    var name = String()
    var price = Int()
}

class TestScrollViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    var recommendMenuData = [recommendMenu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 300
        
        recommendMenuData = [
            recommendMenu(image: UIImage(named: "airbnbImage")!, name: "성수족발", price: 26000),
            recommendMenu(image: UIImage(named: "airbnbImage")!, name: "성수족발", price: 26000),
            recommendMenu(image: UIImage(named: "airbnbImage")!, name: "성수족발", price: 26000),
            recommendMenu(image: UIImage(named: "airbnbImage")!, name: "성수족발", price: 26000)
        ]
        
        tableView.register(RecommendMenuViewCell.self, forCellReuseIdentifier: "RecommendMenuViewCell")
       
    }
    


}

extension TestScrollViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch tableView.tag {
//        case 0:
//            return 1
//        case 1:
//            return 2
//        default:
//            <#code#>
//        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendMenuViewCell") as! RecommendMenuViewCell
        cell.recommendMenuData = recommendMenuData
        return cell

    }
    
    
}
