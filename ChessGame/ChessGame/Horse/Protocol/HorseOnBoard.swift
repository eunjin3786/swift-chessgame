//
//  HorseOnBoard.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal protocol HorseOnBoard {
    func move(to position: Position) -> Bool
    func isMovable(to position: Position) -> Bool
    func isInInitialRange(_ position: Position) -> Bool
}
