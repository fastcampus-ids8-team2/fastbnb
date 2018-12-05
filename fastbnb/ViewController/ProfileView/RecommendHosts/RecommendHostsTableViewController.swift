//
//  RecommendHostsTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class RecommendHostsTableViewController: UITableViewController {
    
    var dataset = [
        ("수입 내역","profilegiftbox.png")
    ]
    
    lazy var list: [RecommendHostsList] = {
        var datalist = [RecommendHostsList]()
        
        for (title,icon) in self.dataset {
            let mvo = RecommendHostsList()
            mvo.title = title
            mvo.icon = icon
            datalist.append(mvo)
            
        }
        return datalist
    }()
    
    
    override func viewDidLoad() {
        tableView.rowHeight = 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! RecommendHostsCell
        
        let title = cell.viewWithTag(101) as? UILabel
        cell.title?.text = row.title
        cell.icon.image = UIImage(named: row.icon!)
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("선택된행은 \(indexPath.row) 번째 행")
    }
    
    
}
