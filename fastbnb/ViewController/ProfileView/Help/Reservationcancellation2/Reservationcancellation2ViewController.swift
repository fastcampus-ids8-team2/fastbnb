//
//  Reservationcancellation2ViewController.swift
//  fastbnb
//
//  Created by wonsik on 20/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class Reservationcancellation2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    
    let data = Reservationcancellation2Data()
}

extension Reservationcancellation2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Reservationcancellation2Cell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "1line", sender: nil)
            
        default:
            return
            
        }
    }
    
}
