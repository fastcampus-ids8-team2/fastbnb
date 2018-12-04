//
//  InviteFriendTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class InviteFriendTableViewController: UITableViewController {
    
    var dataset = [
        ("나의 여행 크레딧"),
        ("이용약관 보기")
    ]
    
    lazy var list: [InviteFriendList] = {
        var datalist = [InviteFriendList]()
        
        for (title) in self.dataset {
            let mvo = InviteFriendList()
            mvo.title = title
            datalist.append(mvo)
            
        }
        return datalist
    }()
    
    
    override func viewDidLoad() {
        tableView.rowHeight = 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! InviteFriendCell
        
        let title = cell.viewWithTag(101) as? UILabel
        cell.title?.text = row.title
        
        
        
        return cell
        
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
    }
}
