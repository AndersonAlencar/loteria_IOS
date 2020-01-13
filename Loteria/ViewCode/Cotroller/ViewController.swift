//
//  ViewController.swift
//  ViewCode
//
//  Created by Anderson Alencar on 12/01/20.
//  Copyright © 2020 Anderson Alencar. All rights reserved.
//

import UIKit




enum GameType: String{
    case megaSena = "Mega-Sena"
    case quina = "Quina"
}

class ViewController: UIViewController {
    
    lazy var drawNumbersView: DrawNumbersView = {
        let view = DrawNumbersView()
        view.generateGameButton.addTarget(self, action: #selector(selectedIndex), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectedIndex()
        self.view = drawNumbersView
    }
    
    func showNumbers(for type: GameType){
        drawNumbersView.topView.topLabel.text = type.rawValue
        var game: Set<Int> = Set<Int>()
        switch type {
            case .megaSena:
                game = calculator(total: 6, universe: 60)
                drawNumbersView.hitsView.last?.isHidden = false
            case .quina:
                game = calculator(total: 5, universe: 80)
                drawNumbersView.hitsView.last?.isHidden = true
        }
        for (index, value) in game.enumerated(){
            drawNumbersView.hitsView[index].ballLabel.text = "\(value)"
        }
    }
    
    func calculator(total: Int, universe: Int) -> Set<Int>{
        var result: Set<Int> = Set<Int>()
        while result.count < total {
            let randomNumber = Int.random(in: 0...universe)
            result.insert(randomNumber)
        }
        return result
    }
    
    @objc func selectedIndex() {
        
        switch drawNumbersView.chooseGameModeSegmentedControl.selectedSegmentIndex {
            case  0:
                showNumbers(for: .megaSena)
            default:
                showNumbers(for: .quina)
        }
    }
}

