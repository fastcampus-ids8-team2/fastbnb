//
//  FrequentlyAskedQuestionsbyHost2ViewController.swift
//  fastbnb
//
//  Created by wonsik on 20/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class FrequentlyAskedQuestionsbyHost2ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        self.tableView.tableFooterView = UIView(frame: .zero)
    }
    
    let data = FrequentlyAskedQuestionsbyHost2Data()
}

extension FrequentlyAskedQuestionsbyHost2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FrequentlyAskedQuestionsbyHost2Cell
        let list = self.data.list[indexPath.row]
        cell.title?.text = list.title
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0: self.performSegue(withIdentifier: "1line", sender: nil)
            case 1: self.performSegue(withIdentifier: "2line", sender: nil)
            case 2: self.performSegue(withIdentifier: "3line", sender: nil)
            case 3: self.performSegue(withIdentifier: "4line", sender: nil)
            case 4: self.performSegue(withIdentifier: "5line", sender: nil)
            case 5: self.performSegue(withIdentifier: "6line", sender: nil)
            case 6: self.performSegue(withIdentifier: "7line", sender: nil)
            case 7: self.performSegue(withIdentifier: "8line", sender: nil)
            case 8: self.performSegue(withIdentifier: "9line", sender: nil)
            case 9: self.performSegue(withIdentifier: "10line", sender: nil)
            
        default:
            return
            
        }
    }
    
}
