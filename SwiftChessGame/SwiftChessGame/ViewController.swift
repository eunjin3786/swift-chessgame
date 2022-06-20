//
//  ViewController.swift
//  SwiftChessGame
//
//  Created by iwill.h on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let board = Board()
        
        board.printScore()
        board.printBoard()
    }
}
