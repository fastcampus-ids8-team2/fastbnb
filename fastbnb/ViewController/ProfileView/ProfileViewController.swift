//
//  ProfileViewController.swift
//  fastbnb
//
//  Created by wonsik on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
@IBDesignable

class ProfileViewController: UIViewController{
    
    @IBOutlet weak var bottomTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomTableView.tableFooterView = UIView(frame: .zero)
        bottomTableView.rowHeight = 70
        
    }
    let data = ProfileData()
    let topData = TopProfileData()
    }


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileCell
        let topCell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath) as! TopProfileCell
        cell.tag = 1
//        topCell.tag
        
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        cell.explain?.text = list.explain
        cell.icon?.image = UIImage(named: list.icon)
        
//        let topList = self.topData.list[indexPath.row]
//        topCell.topTitle?.text = list.title
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
        
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "Notification", sender: nil)
        case 1: self.performSegue(withIdentifier: "InviteFriend", sender: nil)
        case 2: self.performSegue(withIdentifier: "RecommendHosts", sender: nil)
        case 3: self.performSegue(withIdentifier: "TravelCreditsAndCoupons", sender: nil)
        case 4: self.performSegue(withIdentifier: "Payment", sender: nil)
        case 5: self.performSegue(withIdentifier: "Setting", sender: nil)
        case 6: self.performSegue(withIdentifier: "Help", sender: nil)
        case 7: self.performSegue(withIdentifier: "LearnAboutHosting", sender: nil)
        case 8: self.performSegue(withIdentifier: "RegisteringAccommodation", sender: nil)
//        case 9: self.performSegue(withIdentifier: "LeaveFeedback", sender: nil)
            
        default:
            return
        }
    }
}
