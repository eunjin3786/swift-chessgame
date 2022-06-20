//
//  ChessGameTests.swift
//  ChessGameTests
//
//  Created by kakao on 2022/06/20.
//

import XCTest
@testable import ChessGame

struct BoardSpec {
    let pawnsCountPerColor = 8
    let bishopsCountPerColor = 2
    let lukesCountPerColor = 2
    let queensCountPerColor = 1
}

class ChessGameTests: XCTestCase {
    let spec = BoardSpec()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test if chess board size meets the requirement.
    func testBoardSize() throws {
        let board = Board()
        let ranks = board.ranks
        
        // validate ranks
        let isRanksSuccessive = ranks.map({ $0-1 }).dropFirst() == ranks.dropLast()
        XCTAssert(isRanksSuccessive)
        
        let isRanksInRange = ranks.first == 1 && ranks.last == 8
        XCTAssert(isRanksInRange)
        
        // validate files
        let isFilesInRange = board.files.reduce("", +) == "ABCDEFGH"
        XCTAssert(isFilesInRange)
    }
    
    /// Test if horse positions are correct on board initialization.
    func testHorsePositionOnInitBoard() throws {
    }
    
    func testPawnsCount() throws {
        let board = Board()
        XCTAssert(getNumberOfHorses(type: Pawn.self, in: board.whiteHorses) == spec.pawnsCountPerColor)
        XCTAssert(getNumberOfHorses(type: Pawn.self, in: board.blackHorses) == spec.pawnsCountPerColor)
    }
    
    func testBishopsCount() throws {
        let board = Board()
        XCTAssert(getNumberOfHorses(type: Bishop.self, in: board.whiteHorses) == spec.bishopsCountPerColor)
        XCTAssert(getNumberOfHorses(type: Bishop.self, in: board.blackHorses) == spec.bishopsCountPerColor)
    }
    
    func testLukesCount() throws {
        let board = Board()
        XCTAssert(getNumberOfHorses(type: Luke.self, in: board.whiteHorses) == spec.lukesCountPerColor )
        XCTAssert(getNumberOfHorses(type: Luke.self, in: board.blackHorses) == spec.lukesCountPerColor )
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    private func getNumberOfHorses<T: Horse>(type of: T.Type, in horses: [Horse]) -> Int {
        horses.filter({ $0 is T }).count
    }
}
