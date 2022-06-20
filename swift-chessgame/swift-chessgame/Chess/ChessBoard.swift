//
//  ChessBoard.swift
//  swift-chessgame
//
//  Created by Landon.kim on 2022/06/20.
//

import Foundation

class ChessBoard {
    
    var pieces: [[Piece?]] = []
    
    init() {
        setupNewGame()
    }
    
    func setupNewGame() {
        
        // 세 게임 작성
        // pieces = Array(repeating: Array(repeating: Piece(), count: 8), count: 8)
        
        pieces = [
            [Piece(type: .Luke, color: .Black),
             Piece(type: .Knight, color: .Black),
             Piece(type: .Bishop, color: .Black),
             nil,
             Piece(type: .Queen, color: .Black),
             Piece(type: .Bishop, color: .Black),
             Piece(type: .Knight, color: .Black),
             Piece(type: .Luke, color: .Black)],
            Array(repeating: Piece(type: .Pawn, color: .Black), count: 8),
            [nil,nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil,nil],
            [nil,nil,nil,nil,nil,nil,nil,nil],
            Array(repeating: Piece(type: .Pawn, color: .White), count: 8),
            [Piece(type: .Luke, color: .White),
             Piece(type: .Knight, color: .White),
             Piece(type: .Bishop, color: .White),
             nil,
             Piece(type: .Queen, color: .White),
             Piece(type: .Bishop, color: .White),
             Piece(type: .Knight, color: .White),
             Piece(type: .Luke, color: .White)]
        ]
    }
    
    func displayFull() {
        
        
        
    }
    
    func display(row: Int) -> String {
        
        
        return ""
    }
    
    func score(color: PieceColor) -> Int {
        
        
        
        return 0
    }
    
    // A1 -> (0,0) , H2 -> (1, 7) 형태로 index 튜플로 반환
    func interpreter(input: String) -> (Int, Int) {
     
        
        
        
        
        return (0,0)
    }
}
