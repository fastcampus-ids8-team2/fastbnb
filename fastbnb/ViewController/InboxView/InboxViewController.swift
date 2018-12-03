//
//  InboxViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension InboxViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InboxTableViewCell
        cell.userImageView.image = UIImage(named: "inbox")
        cell.userNameLabel.text = "John Doe"
        cell.dateLabel.text = "어제"
        cell.contentsTextView.text = "lorem ipsum"
        return cell
    }
}

extension InboxViewController: UITableViewDelegate {
    
}
