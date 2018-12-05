//
//  InboxDetailViewController.swift
//  fastbnb
//
//  Created by WooJun Kim on 29/11/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit
import AloeStackView
import SnapKit

class InboxDetailViewController: UIViewController {

    @IBOutlet private weak var messageTextField: UITextField!
    @IBOutlet private weak var messageView: UIView!
    let aloeStackView = AloeStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageView.addSubview(aloeStackView)
        aloeStackView.hidesSeparatorsByDefault = true
        aloeStackView.snp.makeConstraints { make in
            make.size.equalTo(messageView)
        }
        
        let sendButton = UIButton()
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(view.tintColor, for: .normal)
        sendButton.frame = CGRect(x: 0, y: 0, width: 50, height: 40)
        sendButton.addTarget(self, action: #selector(touchSendButton), for: .touchUpInside)
        messageTextField.rightView = sendButton
        messageTextField.rightViewMode = .always
    }
    
    @objc func touchSendButton(_ sender: UIButton) {
        guard let message = messageTextField.text else { return }
        if message != "" {
            aloeStackView.addRow(InboxMessageView(message))
        }
        messageTextField.text = ""
    }
}
