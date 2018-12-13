//
//  InboxViewController.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import Fakery

class InboxViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    let faker = Faker(locale: "en-US")
    
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
        cell.userImageView.kf.setImage(with: URL(string: "https://api.adorable.io/avatars/50/]\(Int.random(in: 1...1000)).png"))
        cell.userNameLabel.text = faker.name.name()
        cell.dateLabel.text = "2018-\(Int.random(in: 1...12))-\(Int.random(in: 1...28)) >"
        cell.contentsTextView.text = faker.lorem.sentences()
        return cell
    }
}

extension InboxViewController: UITableViewDelegate {
    
}
