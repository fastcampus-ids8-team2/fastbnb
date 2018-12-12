//
//  FeedbackViewController.swift
//  fastbnb
//
//  Created by wonsik on 12/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: .zero)
        
    }
    let data = FeedbackData()
}

extension FeedbackViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedbackCell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        
        return cell
    }
    
    
    
    
}
