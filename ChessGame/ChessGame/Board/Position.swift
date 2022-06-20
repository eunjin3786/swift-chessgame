//
//  Position.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal struct Position: Equatable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        lhs.file == rhs.file && lhs.rank == rhs.rank
    }
    
    internal let board: BoardAdaptable
    internal var rank: Int
    internal var file: String
    
    init?(rank: Int, file: String, board: BoardAdaptable) {
        self.board = board
        guard self.board.ranks.contains(rank) else { return nil }
        guard self.board.files.contains(file) else { return nil }
        self.rank = rank
        self.file = file
    }
}
