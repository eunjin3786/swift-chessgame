//
//  Piece.swift
//  chessgame
//
//  Created by Grizzly.bear on 2022/06/20.
//

import Foundation

enum PieceType: Int {
    case Pawn = 1
    case Bishop
    case Knight
    case Luke
    case Queen
    case King
    
    var capacity: Int {
        switch self {
        case .Pawn:
            return 8
        case .Bishop, .Knight, .Luke:
            return 2
        case .Queen, .King:
            return 1
        }
    }
    
    var score: Int {
        switch self {
        case .Pawn:
            return 1
        case .Bishop, .Knight:
            return 3
        case .Luke:
            return 5
        case .Queen:
            return 9
        case .King:
            return 0
        }
    }
    
    func getMake(isBlack: Bool = false) -> String {
        if isBlack {
            switch self {
            case .Pawn:
                return "♟"
            case .Bishop:
                return "♝"
            case .Knight:
                return "♞"
            case .Luke:
                return "♜"
            case .Queen:
                return "♛"
            case .King:
                return "."
            }
        } else {
            switch self {
            case .Pawn:
                return "♙"
            case .Bishop:
                return "♗"
            case .Knight:
                return "♘"
            case .Luke:
                return "♖"
            case .Queen:
                return "♕"
            case .King:
                return "."
            }
        }
    }
}
