//
//  SavedViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import AloeStackView


class SavedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 260
        print("\(SavedRoomData.shared.arrayOfData)")
    }
}

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemCell.identifier, for: indexPath) as! SavedItemCell
        cell.nameLabel.text = "London"
        cell.countLabel.text = "5"
        return cell
    }
}
