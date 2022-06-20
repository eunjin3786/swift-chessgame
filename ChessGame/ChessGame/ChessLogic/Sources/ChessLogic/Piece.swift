//
//  File.swift
//  
//
//  Created by jinny on 2022/06/20.
//

import Foundation

enum Color {
    case white
    case black
}

enum MoveDirection {
    case forward
    case cross
    case forwardThenCross
}

protocol Piece {
    var score: Int { get }
    var color: Color { get }
    var displayString: String { get }
}

protocol GamePiece: Piece {
    var moveDirections: [MoveDirection] { get }
}

extension GamePiece {
    
    func movablePositions(currentPosition: Position, boardMatrix: Int) -> [Position] {
        return []
    }
}
                        
struct Pawn: GamePiece {
    let score: Int = 1
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♙"
        case .black:
            return "♟"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward]
    }
}

struct Bishop: GamePiece {
    let score: Int = 3
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♗"
        case .black:
            return "♝"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.cross]
    }
}

struct Knight: GamePiece {
    let score: Int = 3
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♘"
        case .black:
            return "♞"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forwardThenCross]
    }
}

struct Luke: GamePiece {
    let score: Int = 5
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♖"
        case .black:
            return "♜"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward]
    }
}

struct Queen: GamePiece {
    let score: Int = 9
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♕" // U+2655
        case .black:
            return "♛" // U+265B
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward, .cross]
    }
}
