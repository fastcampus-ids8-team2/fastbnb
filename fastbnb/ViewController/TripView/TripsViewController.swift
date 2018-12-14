//
//  TripsViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import AloeStackView

class TripsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 260
    }
}

extension TripsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TripRoomData.shared.arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let trip = TripRoomData.shared.arrayOfData[indexPath.row]
        let room = ListingData.shared.arrayOfCellData.filter { data -> Bool in
            return data.pk == trip.room
        }[0]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripItemCell.identifier, for: indexPath) as! TripItemCell
        cell.cityImageView.kf.setImage(with: URL(string: room.roomPhotos[0].roomPhoto))
        cell.nameLabel.text = "\(room.roomName)"
        cell.countLabel.text = "\(trip.reservedDates.first ?? "") ~ \(trip.reservedDates.last ?? "")"
        return cell
    }
}

extension TripsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        TripRoomData.shared.selectRow = indexPath.row
        return indexPath
    }
}
