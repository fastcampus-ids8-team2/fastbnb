//
//  InboxMessageView.swift
//  fastbnb
//
//  Created by WooJun Kim on 05/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

public class InboxMessageView: UIView {

    // MARK: Lifecycle
    
    public init(_ message: String, isMyMessage: Bool = false) {
        self.isMyMessage = isMyMessage
        super.init(frame: .zero)
        label.text = message
        setUpViews()
        setUpConstraints()
    }
    
    public required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    
    private let label = UILabel()
    private let labelTextMaxLength = 25
    private let imageView = UIImageView()
    private var isMyMessage: Bool
    
    
    private func setUpViews() {
        setUpImageView()
        setUpLabel()
    }
    
    private func setUpLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        addSubview(label)
        
        guard let text = label.text else { return }
        if !text.contains("\n") , text.count > labelTextMaxLength {
            let mText = NSMutableString(string: text)
            for i in 0 ..< Int(floor(Double(text.count / labelTextMaxLength))) {
                mText.insert("\n", at: (i+1) * labelTextMaxLength)
            }
            label.text = String(mText)
        }
    }
    
    private func setUpImageView() {
        imageView.image = isMyMessage ? UIImage(named: "bubbleR") : UIImage(named: "bubble")
        addSubview(imageView)
    }
    
    private func setUpConstraints() {
        guard let image = imageView.image else { return }
        let labelSize = (label.text! as NSString).size(withAttributes: [.font: label.font])
        label.frame = CGRect(x: (isMyMessage ? UIScreen.main.bounds.width - labelSize.width - 30 : 0), y: 0, width: labelSize.width, height: labelSize.height)
        imageView.frame = CGRect(x: label.frame.minX - 10, y: label.frame.minY - 10, width: label.frame.width + 22, height: label.frame.height + 30)
        
        let size = CGSize(width: image.size.width * (isMyMessage ? 0.4 : 0.6), height: image.size.height * 0.6)
        let edgeInset = UIEdgeInsets(top: size.height - 1, left: size.width - 1, bottom: image.size.height - size.height, right: image.size.width - size.width)
        let resizedImage = image.resizableImage(withCapInsets: edgeInset, resizingMode: .stretch)
        
        imageView.image = resizedImage
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        if isMyMessage {
            NSLayoutConstraint.activate([
                label.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
    }

}
