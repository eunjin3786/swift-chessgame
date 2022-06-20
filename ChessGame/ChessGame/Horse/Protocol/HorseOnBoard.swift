//
//  HorseOnBoard.swift
//  ChessGame
//
//  Created by kakao on 2022/06/20.
//

import Foundation

internal protocol HorseOnBoard {
    func move(to position: Position) -> Bool
    func checkMovable(to position: Position) -> Bool
}
