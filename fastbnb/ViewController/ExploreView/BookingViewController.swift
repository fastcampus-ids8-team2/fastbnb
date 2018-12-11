//
//  BookingViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 11/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    var data: Result? = nil
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var checkAvailability: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let bookingData = data else { return }
      checkAvailability.layer.cornerRadius = 10
        print("data: ", bookingData)
        
    }
    


 
}

extension BookingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = Bundle.main.loadNibNamed("BookingImageTableViewCell", owner: self, options: nil)?.first as! BookingImageTableViewCell
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 250
        
    }
    
}
