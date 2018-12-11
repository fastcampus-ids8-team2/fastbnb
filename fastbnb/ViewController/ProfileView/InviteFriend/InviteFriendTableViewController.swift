//
//  InviteFriendTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class InviteFriendViewController: UIViewController{
   
    @IBOutlet weak var tableView: UITableView!
    
  
    override func viewDidLoad() {
        tableView.rowHeight = 50
       
        self.tableView.tableFooterView = UIView(frame: .zero)
        
    }
    let data = InviteFriendData()
}
    
    extension InviteFriendViewController: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.data.list.count
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InviteFriendCell
            let list = self.data.list[indexPath.row]
            cell.title?.text = list.title
            
            return cell
        }
    

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
            
             switch indexPath.row {
            case 0: self.performSegue(withIdentifier: "a", sender: nil)
            
            default:
            return
            }
        
}
}
