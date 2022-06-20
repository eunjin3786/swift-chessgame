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
//        TODO: -
//        특정 말을 옮기는 메소드는 Board에서 제공한다.
//        같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
//        말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
//        만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
        return true
    }
}

struct Position {
    let x, y: Int
}
