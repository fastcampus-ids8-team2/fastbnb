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
             case 1:
                UIApplication.shared.openURL(NSURL(string: "https://www.airbnb.co.kr/help/article/2269/airbnb-referral-program-terms-and-conditions?q=%EC%97%90%EC%96%B4%EB%B9%84%EC%95%A4%EB%B9%84%20%EC%B6%94%EC%B2%9C%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%A8")! as URL)
            default:
            return
            }
        
}
}
