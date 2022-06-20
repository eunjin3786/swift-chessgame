//
//  Piece.swift
//  swift-chessgame
//
//  Created by Landon.kim on 2022/06/20.
//

import Foundation

public enum PiecesType: Int {
    
    case Pawn
    case Bishop
    case Knight
    case Luke
    case Queen

    // Pawn 1점, Bishop와 Knight 3점, Luke 5점, 퀸은 9 점
    
    var score: Int {
        
        switch self {
            case .Pawn:     return 1
            case .Bishop:   return 3
            case .Knight:   return 3
            case .Luke:     return 5
            case .Queen:    return 9
        }
    }
}

public enum PieceColor {
    case White
    case Black
}

public class Piece {
    
    var type: PiecesType = .Pawn
    var color: PieceColor = .White
    
    init(type: PiecesType = .Pawn, color: PieceColor = .White ) {
        self.type = type
        self.color = color
    }
    
    /**
     
     흑색 Pawn는 ♟ U+265F, Knight는 ♞ U+265E, Biship은 ♝ U+265D, Luke는 ♜ U+265C, Queen은 ♛ U+265B를 빈 곳은 "."을 표시한다.
     
     백색 Pawn는 ♙ U+2659, Knight는 ♘ U+2658, Biship은 ♗ U+2657, Luke는 ♖ U+2656, Queen은 ♕ U+2655를 빈 곳은 "."을 표시한다.
     
     */
    
    func display() -> Character {
        if self.color == .White {
            switch self.type {
                case .Pawn:     return "♙"
                case .Bishop:   return "♗"
                case .Knight:   return "♘"
                case .Luke:     return "♖"
                case .Queen:    return "♕"
            }
        } else {
            switch self.type {
                case .Pawn:     return "♟"
                case .Bishop:   return "♝"
                case .Knight:   return "♞"
                case .Luke:     return "♜"
                case .Queen:    return "♛"
            }
        }
    }
}
