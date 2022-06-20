//
//  Horse.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal class Horse {
    enum HorseColor {
        case black
        case white
    }
    
    let color: HorseColor
    var position: Position
    var score: Int
    
    init(color: HorseColor, position: Position, score: Int) {
        self.position = position
        self.color = color
        self.score = score
    }
    
    internal func getDistance(to position: Position) -> Int {
        return 0
    }
}
