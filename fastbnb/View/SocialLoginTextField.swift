//
//  SocialLoginTextField.swift
//  fastbnb
//
//  Created by WooJun Kim on 28/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

@IBDesignable
public class SocialLoginTextField: UITextField {
    
    class PaddingLabel: UILabel{
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)))
        }
    }
    
    @IBInspectable var leftLabel: String? {
        get { return (leftView as? PaddingLabel)?.text }
        set {
            let leftLabel = PaddingLabel()
            leftLabel.text = newValue
            leftLabel.textAlignment = .right
            leftLabel.frame = CGRect(x: 0, y: 15, width: 70, height: 30)
            leftView = leftLabel
            leftViewMode = .always
        }
    }
    
    var borderLayer: CALayer?
    @IBInspectable var underlineWidth: CGFloat {
        get { return self.borderLayer?.borderWidth ?? 0.0 }
        set {
            let borderLayer = CALayer()
            borderLayer.frame = CGRect(x: 70, y: frame.height + 5, width: frame.width-70, height: 1)
            borderLayer.borderWidth = newValue
            layer.addSublayer(borderLayer)
            self.borderLayer = borderLayer
        }
    }
}
