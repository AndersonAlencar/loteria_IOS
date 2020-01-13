//
//  HeaderView.swift
//  ViewCode
//
//  Created by Anderson Alencar on 12/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    lazy var topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "top"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.text = "Mega-Sena"
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.systemFont(ofSize: 32.0)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        return topLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
}

extension HeaderView: ViewCode {
    func buildHierarchy() {
        addSubview(topImageView)
        addSubview(topLabel)
    }
    
    func setUpConstraints() {
        //Um activate para cada View
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        topLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        topLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}
