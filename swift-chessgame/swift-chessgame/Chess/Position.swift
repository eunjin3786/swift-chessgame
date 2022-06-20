//
//  Position.swift
//  swift-chessgame
//
//  Created by main on 2022/06/20.
//

import Foundation

enum PositionError: Error {
    case outOfRange
}

final class Position {
    private var x: Int
    private var y: Int
    
    private func checkBound(_ point: Int) throws {
        guard point >= 0 else {
            throw PositionError.outOfRange
        }
        
        guard point < 8 else {
            throw PositionError.outOfRange
        }
    }
    
    init(x: Int, y: Int) throws {
        self.x = x
        self.y = y
        
        try checkBound(x)
        try checkBound(y)
    }
}

protocol ChessPiece {
    var position: Position { get set }
}
