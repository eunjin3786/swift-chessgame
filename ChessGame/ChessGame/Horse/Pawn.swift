//
//  Pawn.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal class Pawn: Horse, HorseOnBoard {
    init?(color: Horse.HorseColor, position: Position) {
        super.init(color: color, position: position, score: 1)
        guard self.isInInitialRange(position) else { return nil }
    }
    
    func move(to position: Position) -> Bool {
        guard isMovable(to: position) else { return false }
        self.position = position
        return true
    }
    
    func isMovable(to position: Position) -> Bool {
        switch color {
        case .black:
            return self.position.rank < position.rank
        case .white:
            return self.position.rank > position.rank
        }
    }
    
    func isInInitialRange(_ position: Position) -> Bool {
        switch color {
        case .black:
            return position.rank == 2
        case .white:
            return position.rank == 7
        }
    }
}
