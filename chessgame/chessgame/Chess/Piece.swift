//
//  Piece.swift
//  chessgame
//
//  Created by Grizzly.bear on 2022/06/20.
//

import Foundation

enum Team {
    case black
    case white
}

enum moveDirection {
    case left
    case right
    case up
    case down
    case upleft
    case upright
    case downleft
    case downright
}

enum moveMomentum {
    case one
    case unlimit
}

enum PieceType: Int {
    case pawn = 1
    case bishop
    case knight
    case luke
    case queen
    case king
    
    var capacity: Int {
        switch self {
        case .pawn:
            return 8
        case .bishop, .knight, .luke:
            return 2
        case .queen, .king:
            return 1
        }
    }
    
    var score: Int {
        switch self {
        case .pawn:
            return 1
        case .bishop, .knight:
            return 3
        case .luke:
            return 5
        case .queen:
            return 9
        case .king:
            return 0
        }
    }
}


class Piece {
    let team: Team
    let type: PieceType
    let position: Position
    
    var mark: String {
        if team == .black {
            switch type {
            case .pawn:
                return "♟"
            case .bishop:
                return "♝"
            case .knight:
                return "♞"
            case .luke:
                return "♜"
            case .queen:
                return "♛"
            case .king:
                return "."
            }
        } else {
            switch type {
            case .pawn:
                return "♙"
            case .bishop:
                return "♗"
            case .knight:
                return "♘"
            case .luke:
                return "♖"
            case .queen:
                return "♕"
            case .king:
                return "."
            }
        }
    }
    
    required init(team: Team = .black, type: PieceType = .pawn, position: Position) {
        self.team = team
        self.type = type
        self.position = position
    }
    
}
