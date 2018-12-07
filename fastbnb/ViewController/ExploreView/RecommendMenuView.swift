//
//  File.swift
//  fastbnb
//
//  Created by Isaac Kim on 07/12/2018.
//  Copyright © 2018 fastcampus. All rights reserved.
//

import UIKit

class RecommendMenuView: UIView {
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let priceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        configureLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.addSubview(imageView)
        
        nameLabel.textAlignment = .center
        self.addSubview(nameLabel)
        
        priceLabel.textAlignment = .center
        self.addSubview(priceLabel)
    }
    
    private struct Standard {
        static let space: CGFloat = 10
        
        static let imageViewMultiplier: CGFloat = 0.7
        static let nameLabelMultiplier: CGFloat = 0.15
        static let priceLabelMultiplier: CGFloat = 0.15
    }
    
    private func configureLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.imageViewMultiplier).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.nameLabelMultiplier).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Standard.priceLabelMultiplier).isActive = true
        
    }
}
