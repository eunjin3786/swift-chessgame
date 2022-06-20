//
//  Bishop.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal class Bishop: Horse, HorseOnBoard {
    init(color: HorseColor, position: Position) {
        super.init(color: color, position: position, score: 3)
    }
    
    func move(to position: Position) -> Bool {
        return false
    }
    
    func checkMovable(to position: Position) -> Bool {
        return false
    }
}
