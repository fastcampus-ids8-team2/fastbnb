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
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SavedRoomData.shared.getDataFromServer()
        tableView.reloadData()
        print("is it working?")
    }
}

extension SavedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SavedRoomData.shared.arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let room = SavedRoomData.shared.arrayOfData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemCell.identifier, for: indexPath) as! SavedItemCell
        cell.cityImageView.kf.setImage(with: URL(string: room.roomPhotos[0].roomPhoto))  
        cell.nameLabel.text = "\(room.roomName)"
        cell.countLabel.text = "\(room.personCapacity) home"
        return cell
    }
}

extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        SavedRoomData.shared.selectRow = indexPath.row
        return indexPath
    }
}
