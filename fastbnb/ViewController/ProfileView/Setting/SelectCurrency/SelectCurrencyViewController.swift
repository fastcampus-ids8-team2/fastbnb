//
//  SelectCurrencyViewController.swift
//  fastbnb
//
//  Created by wonsik on 13/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class SelectCurrencyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    let data = SelectCurrencyData()
}

extension SelectCurrencyViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectCurrencyCell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        return cell
    }
    
    
}
