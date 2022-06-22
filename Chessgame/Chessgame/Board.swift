//
//  Board.swift
//  Chessgame
//
//  Created by faker on 2022/06/20.
//

import Foundation

class Board {
    
    let chessboard = [[Piece?]](repeating: [Piece?](repeating: nil, count: 8), count: 8)

}

/*
ABCDEFGH
1♜♞♝.♛♝♞♜
2♟♟♟♟♟♟♟♟
3........
4........
5........
6........
7♙♙♙♙♙♙♙♙
8♖♘♗.♕♗♘♖
ABCDEFGH
*/
