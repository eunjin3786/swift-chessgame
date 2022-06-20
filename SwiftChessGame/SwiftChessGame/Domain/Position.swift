//
//  Position.swift
//  SwiftChessGame
//
//  Created by iwill.h on 2022/06/20.
//

import Foundation

struct Position {
    let rank: UInt8
    let file: UInt8
}

extension Position {
    init?(value: String) {
        guard let rank = value.first, let file = value.last, value.count == 2 else { return nil }
        
        switch (rank, file) {
        case ("A"..."H", "1"..."8"):
            let rank = rank.asciiValue! - Character("A").asciiValue!
            let file = file.asciiValue! - Character("1").asciiValue!
            
            self.init(rank: rank, file: file)
        default:
            return nil
        }
    }
}
