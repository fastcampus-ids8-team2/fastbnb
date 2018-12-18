//
//  HelpViewController.swift
//  fastbnb
//
//  Created by wonsik on 18/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.rowHeight = 70
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    let data = HelpData()
}
extension HelpViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HelpCell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
        
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "Frequently Asked Questions", sender: nil)
        case 1: self.performSegue(withIdentifier: "Frequently Asked Questions by Host", sender: nil)
        case 2: self.performSegue(withIdentifier: "Fares and Reserved", sender: nil)
        case 3: self.performSegue(withIdentifier: "Reservation cancellation", sender: nil)
        case 4: self.performSegue(withIdentifier: "Add Billing Information", sender: nil)
        default:
            return
        }
        
    }
    
    
}
