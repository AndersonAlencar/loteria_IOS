//
//  DrawNumbersView.swift
//  ViewCode
//
//  Created by Anderson Alencar on 12/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit

class DrawNumbersView: UIView {

    lazy var topView: HeaderView = {
        let headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    lazy var chooseGameModeSegmentedControl: UISegmentedControl = {
        let gameSegment = UISegmentedControl(items: ["Mega-Sena","Quina"])
        gameSegment.selectedSegmentIndex = 0
        gameSegment.translatesAutoresizingMaskIntoConstraints = false
        return gameSegment
    }()
    
    lazy var generateGameButton: UIButton = {
        let genareteButton = UIButton()
        genareteButton.backgroundColor = UIColor(red:0.21, green:0.47, blue:0.77, alpha:1.0)
        genareteButton.setTitle("Gerar Jogo", for: UIControl.State.normal)
        genareteButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        genareteButton.layer.cornerRadius = 10
        genareteButton.translatesAutoresizingMaskIntoConstraints = false
        return genareteButton
    }()
    
    lazy var hitsView: [HitView] = {
        var hitsView = [HitView]()
        for i in 0...5{
            hitsView.append(HitView())
            hitsView[i].translatesAutoresizingMaskIntoConstraints = false
        }
        return hitsView
    }()
    
    
    lazy var verticalStackHit: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.axis = .vertical
        verticalStack.distribution  = .equalCentering
        verticalStack.alignment = .center
        verticalStack.addArrangedSubview(horizontalStackHitTop)
        verticalStack.addArrangedSubview(horizontalStackHitBottom)
        verticalStack.spacing = 22
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        return verticalStack
    }()
    
    lazy var horizontalStackHitTop: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 12
        for i in 0...2{
            horizontalStack.addArrangedSubview(hitsView[i])
        }
        return horizontalStack
    }()
    
    lazy var horizontalStackHitBottom: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 12
        for i in 3...5{
            horizontalStack.addArrangedSubview(hitsView[i])
        }
        return horizontalStack
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

extension DrawNumbersView: ViewCode {
    func buildHierarchy() {
        addSubview(topView)
        addSubview(chooseGameModeSegmentedControl)
        addSubview(verticalStackHit)
        addSubview(generateGameButton)
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackHit.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackHit.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackHit.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            verticalStackHit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            chooseGameModeSegmentedControl.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 30),
            chooseGameModeSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            chooseGameModeSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            generateGameButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            generateGameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            generateGameButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
    func additionalConfigurations() {
        backgroundColor = UIColor.white
    }
    
}
