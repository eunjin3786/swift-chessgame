//
//  Piece.swift
//  Chessgame
//
//  Created by faker on 2022/06/20.
//

import Foundation

protocol PieceProtocol
{
    func move()
    func die()
}

class Piece: PieceProtocol {

    var type: PieceType
    var color: PieceColor
    
    func move() {
        print("말이동")
    }
    
    func die() {
        print("말죽음")
    }
    
    init(type: PieceType, color: PieceColor) {
        self.type = type
        self.color = color
    }

}
