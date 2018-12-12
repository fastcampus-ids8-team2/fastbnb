//
//  SettingTableViewController.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.rowHeight = 70
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    let data = SettingData()
}
extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingCell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
        
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "a", sender: nil)
        case 1: self.performSegue(withIdentifier: "b", sender: nil)
        case 2: self.performSegue(withIdentifier: "c", sender: nil)
        case 3: self.performSegue(withIdentifier: "d", sender: nil)
        default:
            return
        }
        
    }
  
    
}
