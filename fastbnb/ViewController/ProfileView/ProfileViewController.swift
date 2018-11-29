//
//  ProfileViewController.swift
//  fastbnb
//
//  Created by wonsik on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let profileList = ProfileList()
    private var items: [ProfileItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = profileList.items
        tableView.rowHeight = 65
      
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        
        cell.setupCell(title: items[indexPath.row].title, imageName: items[indexPath.row].imageName)
        return cell
        
        
    }
    
    
    
    
}





