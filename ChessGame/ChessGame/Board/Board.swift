//
//  Board.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

protocol BoardAdaptable {
    var ranks: [Int] { get }
    var files: [String] { get }
}

internal class Board: BoardAdaptable  {
    internal let ranks = Array((1...8))
    internal let files = ["A", "B", "C", "D", "E", "F", "G", "H"]
    internal var whiteHorses = [Horse]()
    internal var blackHorses = [Horse]()
    
    init() {
        // generate pawns
        files.forEach { file in
            guard let whitePosition = Position(rank: 7, file: file, board: self),
                  let blackPosition = Position(rank: 2, file: file, board: self) else {
                fatalError("Failed to generate Board")
            }
            self.whiteHorses.append(Pawn(color: .white, position: whitePosition))
            self.blackHorses.append(Pawn(color: .black, position: blackPosition))
        }
    }
    
    internal func move(horse: Horse & HorseOnBoard, to position: Position) -> Bool {
        guard checkMovable(horse: horse, to: position) else { return false }
        return horse.move(to: position)
    }
    
    internal func checkMovable(horse: Horse, to position: Position) -> Bool {
        switch horse.color {
        case .black:
            return !blackHorses.contains(where: { $0.position == position })
        case .white:
            return !whiteHorses.contains(where: { $0.position == position })
        }
    }
    
    internal func display() {
        
    }
}
