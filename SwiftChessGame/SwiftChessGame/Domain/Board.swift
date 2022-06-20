//
//  Board.swift
//  SwiftChessGame
//
//  Created by iwill.h on 2022/06/20.
//

import Foundation

protocol BoardBase {
    func initialize()
    func printBoard()
    func printScore()
    
    func canMove(from: Position, to: Position) -> Bool
    func moveablePostions(from: Position) -> [Position]
}

extension Piece {
    func displayIcon() -> String {
        switch self.type {
        case .knight:
            return color == .white ? "♘" : "♞"
        case .bishop:
            return color == .white ? "♗" : "♝"
        case .queen:
            return color == .white ? "♕" : "♛"
        case .luke:
            return color == .white ? "♖" : "♜"
        case .pawn:
            return color == .white ? "♙" : "♟"
        }
    }
}

extension BoardOn {
    func displayIcon() -> String {
        switch self {
        case .none:
            return "."
        case .piece(let piece):
            return piece.displayIcon()
        }
    }
}

extension PieceType {
    var score: Int {
        switch self {
        case .knight, .bishop:      return 3
        case .queen:                return 9
        case .luke:                 return 5
        case .pawn:                 return 1
        }
    }
}


class Board: BoardBase {
    func canMove(from: Position, to: Position) -> Bool {
        true
    }
    
    func moveablePostions(from: Position) -> [Position] {
        []
    }
    
    private var matrix: [[BoardOn]] = Array(repeating: Array(repeating: .none, count: 8), count: 8)
    
    init() {
        self.initialize()
    }
    
    func initialize() {
        let blackBack: [BoardOn] = [.piece(piece: Piece(type: .luke, color: .black)),
                                    .piece(piece: Piece(type: .knight, color: .black)),
                                    .piece(piece: Piece(type: .bishop, color: .black)),
                                    .none,
                                    .piece(piece: Piece(type: .queen, color: .black)),
                                    .piece(piece: Piece(type: .bishop, color: .black)),
                                    .piece(piece: Piece(type: .knight, color: .black)),
                                    .piece(piece: Piece(type: .luke, color: .black))]
        
        let whiteBack: [BoardOn] = [.piece(piece: Piece(type: .luke, color: .white)),
                                    .piece(piece: Piece(type: .knight, color: .white)),
                                    .piece(piece: Piece(type: .bishop, color: .white)),
                                    .none,
                                    .piece(piece: Piece(type: .queen, color: .white)),
                                    .piece(piece: Piece(type: .bishop, color: .white)),
                                    .piece(piece: Piece(type: .knight, color: .white)),
                                    .piece(piece: Piece(type: .luke, color: .white))]
        matrix[0] = blackBack
        matrix[1] = Array(repeating: .piece(piece: Piece.init(type: .pawn, color: .black)), count: 8)
        
        matrix[6] = Array(repeating: .piece(piece: Piece.init(type: .pawn, color: .white)), count: 8)
        matrix[7] = whiteBack
    }
    
    func printBoard() {
        for rank in 0..<matrix.count {
            var row = ""
            for file in 0..<matrix[rank].count {
                row.append(matrix[rank][file].displayIcon())
            }
            print(row)
        }
    }
    
    func printScore() {
        var black = 0
        var white = 0
        
        for rank in 0..<matrix.count {
            for file in 0..<matrix[rank].count {
                switch matrix[rank][file] {
                case let .piece(piece):
                    switch piece.color {
                    case .black:
                        black += piece.type.score
                    case .white:
                        white += piece.type.score
                    }
                default:
                    break
                }
            }
        }
        print("흑: \(black)점\n백: \(white)점")
    }
}
