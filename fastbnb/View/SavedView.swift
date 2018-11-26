//
//  SavedView.swift
//  fastbnb
//
//  Created by Isaac Kim on 26/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import AloeStackView

struct SavedView {
    
    
     func labelView(view: UIView) {
        
        let aloeStackView = AloeStackView()
        aloeStackView.backgroundColor = #colorLiteral(red: 0.9467055202, green: 0.692401018, blue: 0.7270359759, alpha: 1)
        aloeStackView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(aloeStackView)
       
        let label1 = UILabel()
        label1.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        label1.text = "hello world"
        aloeStackView.addRow(label1)
        
    }
    
    
}
