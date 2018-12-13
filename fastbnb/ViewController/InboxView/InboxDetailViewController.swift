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
import Fakery

class InboxDetailViewController: UIViewController {

    @IBOutlet private weak var messageTextField: UITextField!
    @IBOutlet private weak var messageView: UIView!
    let aloeStackView = AloeStackView()
    let faker = Faker(locale: "en-US")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inbox"
        
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
        
        for _ in 0...faker.number.randomInt(min: 1, max: 5) {
            aloeStackView.addRow(InboxMessageView(faker.lorem.sentence(wordsAmount: Int.random(in: 1...4)), isMyMessage: Bool.random()))
        }
    }
    
    @objc func touchSendButton(_ sender: UIButton) {
        guard let message = messageTextField.text else { return }
        if message != "" {
            aloeStackView.addRow(InboxMessageView(message, isMyMessage: false))
        }
        messageTextField.text = ""
    }
}

extension InboxDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        touchSendButton(UIButton())
        messageTextField.resignFirstResponder()
        return true
    }
}
