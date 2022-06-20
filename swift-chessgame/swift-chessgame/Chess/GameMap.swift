//
//  GameMap.swift
//  swift-chessgame
//
//  Created by main on 2022/06/20.
//

import Foundation

final class GameMap {
    private lazy var gameMap: [[ChessPiece]] = createEmptyMap()
    
    private func createEmptyMap() -> [[ChessPiece]] {
        return [[Empty]] (repeating: Array(repeating: Empty(x: 0, y: 0),count: 8 ),
                          count: 8)
    }
}
