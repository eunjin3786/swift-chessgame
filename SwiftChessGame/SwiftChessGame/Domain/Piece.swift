//
//  Piece.swift
//  SwiftChessGame
//
//  Created by iwill.h on 2022/06/20.
//

import Foundation

protocol PieceBase {
    var type: PieceType { get }
    var color: PieceColor { get }
    
    func canMove(from: Position, to position: Position, in board: Board) -> Bool
}

struct Piece: PieceBase {
    let type: PieceType
    let color: PieceColor
    
    func canMove(from: Position, to position: Position, in board: Board) -> Bool {
        return true
    }
}
