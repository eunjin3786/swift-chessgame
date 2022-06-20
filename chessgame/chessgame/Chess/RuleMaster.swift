//
//  RuleMaster.swift
//  chessgame
//
//  Created by Grizzly.bear on 2022/06/20.
//

import Foundation

// Piece 들에 액션 position -> position으로 가능 한지 여부
class RuleMaster {
    var board: Board?
    
    func canMove(from: Piece, to: Piece) -> Bool {
        return false
    }
    
    private func checkMyteam(from: Piece, to: Piece) -> Bool {
        return false
    }
}
