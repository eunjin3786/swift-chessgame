//
//  Board.swift
//  chessgame
//
//  Created by Grizzly.bear on 2022/06/20.
//

import Foundation

enum Rank: String {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"
}

enum File: String {
    case f1 = "1"
    case f2 = "2"
    case f3 = "3"
    case f4 = "4"
    case f5 = "5"
    case f6 = "6"
    case f7 = "7"
    case f8 = "8"
}

struct Position {
    let rank: Rank
    let file: File
}

class Board {
    
}
