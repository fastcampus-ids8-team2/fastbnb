//
//  ProfileButton.swift
//  fastbnb
//
//  Created by wonsik on 30/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
@IBDesignable

class ProfileButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius}
        set { layer.cornerRadius = newValue}
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {return layer.borderWidth }
        set { layer.borderWidth = newValue} 
        
        
    }
    

    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.blue.cgColor)}
        set { layer.borderColor = newValue.cgColor}
    }
}
