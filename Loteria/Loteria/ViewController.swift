//
//  ViewController.swift
//  Loteria
//
//  Created by Anderson Souza on 26/05/19.
//  Copyright © 2019 Anderson Souza. All rights reserved.
//

import UIKit

enum GameType: String{
    case megaSena = "Mega-Sena"
    case quina = "Quina"
}

//infix operator <->
func calculator(total: Int, universe: Int) -> [Int]{
    var result: [Int] =  []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe)) + 1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}
class ViewController: UIViewController {

    
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megaSena)
        // Do any additional setup after loading the view.
    }
    func showNumbers(for type: GameType){
        lbGameType.text = type.rawValue
        var game: [Int] = []
        switch type {
            case .megaSena:
                game = calculator(total: 6, universe: 60)
                balls.last!.isHidden = false
            case .quina:
                game = calculator(total: 5, universe: 80)
                balls.last!.isHidden = true
        }
        for (index, game) in game.enumerated(){
            balls[index].setTitle( "\(game)", for: .normal)
        }
    }

    @IBAction func generateGame() {
    
        switch scGameType.selectedSegmentIndex {
        case  0:
            showNumbers(for: .megaSena)
        default:
            showNumbers(for: .quina)
        }
    }
    
    
    
}

