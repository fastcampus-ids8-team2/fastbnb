//
//  SettingTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var dataset = [
        ("알림"),
        ("통화 단위"),
        ("대금 수령 방법"),
        ("서비스 약관"),
        ("버전:18.47(200495"),
        ("로그아웃")
        
    ]
    
    lazy var list: [SettingList] = {
        var datalist = [SettingList]()
        
        for (title) in self.dataset {
            let mvo = SettingList()
            mvo.title = title
            datalist.append(mvo)
            
        }
        return datalist
    }()
    
    
    override func viewDidLoad() {
        tableView.rowHeight = 70
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! SettingCell
        
        let title = cell.viewWithTag(101) as? UILabel
        
        cell.title?.text = row.title
        
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("선택된행은 \(indexPath.row) 번째 행")
    }
    
    
}
