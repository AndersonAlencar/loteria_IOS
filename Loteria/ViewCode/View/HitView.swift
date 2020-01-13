//
//  HitView.swift
//  ViewCode
//
//  Created by Anderson Alencar on 12/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class HitView: UIView {

   
    lazy var ballImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ball"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var ballLabel: UILabel = {
        let ballLabel = UILabel()
        ballLabel.textColor = UIColor.black
        ballLabel.font = UIFont.systemFont(ofSize: 44.0)
        ballLabel.translatesAutoresizingMaskIntoConstraints = false
        return ballLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    
}

extension HitView: ViewCode{
    func buildHierarchy() {
        addSubview(ballImage)
        addSubview(ballLabel)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            ballImage.topAnchor.constraint(equalTo: topAnchor),
            ballImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            ballImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            ballImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            ballLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ballLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
