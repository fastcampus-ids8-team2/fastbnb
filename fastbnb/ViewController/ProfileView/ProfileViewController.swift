//
//  ProfileViewController.swift
//  fastbnb
//
//  Created by wonsik on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//
// ProfileItem(title: "알림", imageName: "profileBell", explanation: ""),
//ProfileItem(title: "친구를 초대하세요", imageName: "profilegiftbox", explanation: ""),
//ProfileItem(title: "호스트 초대하기", imageName: "profilegiftbox", explanation: "호스트를 추천하고 한 명당 16,946을 적립하세요"),
//ProfileItem(title: "여행 크레딧과 쿠폰", imageName: "profileMedal", explanation: ""),
//ProfileItem(title: "트립 호스팅하기", imageName: "profileTree", explanation: ""),
//ProfileItem(title: "결제", imageName: "profileCard", explanation: ""),
//ProfileItem(title: "설정", imageName: "profileSetting", explanation: ""),
//ProfileItem(title: "도움말", imageName: "profileQuestion", explanation: ""),
//ProfileItem(title: "호스팅에 관해 알아보기", imageName: "profileHouse", explanation: "월간 최대 1,656,519의 수입을 올리세요"),
//ProfileItem(title: "숙소 등록하기", imageName: "profileHouse", explanation: ""),
//ProfileItem(title: "피드백 남기기", imageName: "profileCard", explanation: ""),


import UIKit
@IBDesignable

class ProfileViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var dataset = [
//    ("알림","profileBell"),("친구를 초대하세요", "profilegiftbox"),("호스트 초대하기","profilegiftbox"),("여행 크레딧과 쿠폰","profileMedal"),("트립 호스팅하기","profileTree"),("결제","profileCard"),("설정","profileSetting"),("도움말","profileQusetion"),("호스팅에 관해 알아보기","profileHouse"),("숙소 등록하기","profileHouse"),("피드백 남기기","profileCard")
//    ]
    
    
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
//        items.append(items)
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let row = self.profileList[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        
        cell.setupCell(title: items[indexPath.row].title, imageName: items[indexPath.row].imageName)
       
        return cell
        
        
    }
    
    
    
    
}





