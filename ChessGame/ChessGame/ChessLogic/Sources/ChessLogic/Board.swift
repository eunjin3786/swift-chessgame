//
//  File.swift
//  
//
//  Created by jinny on 2022/06/20.
//

import Foundation

struct Board {
    
    var pieces: [[GamePiece?]]
    
    init() {
        pieces = [
            firstLine(color: .black),
            Array(repeating: Pawn(color: .black), count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: Pawn(color: .white), count: 8),
            firstLine(color: .white)
        ]
        
        func firstLine(color: Color) -> [GamePiece?] {
            return [
                Luke(color: color),
                Knight(color: color),
                Bishop(color: color),
                nil,
                Queen(color: color),
                Bishop(color: color),
                Knight(color: color),
                Luke(color: color),
            ]
        }
    }
    
    func display() -> String {
        var fullText = ""
        
        for i in 0..<8 {
            if i != 0 {
                fullText += "\n"
            }
            
            for j in 0..<8 {
                fullText += pieces[i][j]?.displayString ?? "."
            }
        }
        
        return fullText
    }
    
    func move(from: Position, to: Position) -> Bool {
        return true
    }
}

struct Position {
    let x, y: Int
}
