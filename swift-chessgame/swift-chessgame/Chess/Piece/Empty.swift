//
//  Empty.swift
//  swift-chessgame
//
//  Created by main on 2022/06/20.
//

import Foundation

class Empty: ChessPiece {
    var position: Position
    
    init(x: Int, y: Int) {
        do {
            position = try Position(x: x, y: y)
        } catch {
            position = try! Position(x: 0, y: 0)
        }
    }
}
