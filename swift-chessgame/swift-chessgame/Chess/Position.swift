//
//  Position.swift
//  swift-chessgame
//
//  Created by main on 2022/06/20.
//

import Foundation

final class Position {
    var x: Int = 0
    var y: Int = 0
}

protocol ChessPiece {
    var position: Position { get set }
}
