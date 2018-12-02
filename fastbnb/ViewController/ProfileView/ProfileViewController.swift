//
//  ProfileViewController.swift
//  fastbnb
//
//  Created by wonsik on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
@IBDesignable

class ProfileViewController: UITableViewController{
    
    var dataset = [
        ("알림","", "profileBell.png"),
        ("친구를 초대하세요","","profilegiftbox.png"),
        ("호스트 추천하기","호스트를 추천하고 한명당 16,802을 적립하세요","profilegiftbox.png"),
        ("여행 크레딧과 쿠폰","","profileMedal.png"),
        ("트립 호스팅하기","","profileTree.png"),
        ("결제","","profileCard.png"),
        ("설정","","profileBell.png"),
        ("도움말","","profileQuestion.png"),
        ("호스팅에 관해 알아보기","월간 최대 1681663의 수입을 올리세요","profileHouse.png"),
        ("숙소등록하기","","profileHouse.png"),
        ("피드백 남기기","","profileCard.png")
    ]
    
    
    
    
    lazy var list: [ProfileList] = {
        var datalist = [ProfileList]()
        
        
        for (title, explain, icon) in self.dataset {
            let mvo = ProfileList()
            mvo.title = title
            mvo.explain = explain
            mvo.icon = icon
            datalist.append(mvo)
            
        }
        return datalist
    }()

    
    override func viewDidLoad() {
        tableView.rowHeight = 70
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    
    override func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let row = self.list[indexPath.row]
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ProfileCell
        
        let title = cell.viewWithTag(101) as? UILabel
        let explain = cell.viewWithTag(102) as? UILabel
        cell.title?.text = row.title
        
        
        cell.title?.text = row.title
        cell.explain?.text = row.explain
        cell.icon.image = UIImage(named: row.icon!)
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NSLog("선택된행은 \(indexPath.row) 번째 행입니다")
    }
    
    
    
    
}
