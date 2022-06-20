//
//  Pawn.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal class Pawn: Horse, HorseOnBoard {
    init(color: Horse.HorseColor, position: Position) {
        super.init(color: color, position: position, score: 1)
    }
    
    func move(to position: Position) -> Bool {
        guard checkMovable(to: position) else { return false }
        self.position = position
        return true
    }
    
    func checkMovable(to position: Position) -> Bool {
        switch color {
        case .black:
            return self.position.rank < position.rank
        case .white:
            return self.position.rank > position.rank
        }
    }
}
