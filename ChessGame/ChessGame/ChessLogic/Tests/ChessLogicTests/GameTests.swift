import Foundation
import XCTest
@testable import ChessLogic

class GameTests: XCTestCase {
    
    var game: Game!
    var presenterMock: GamePresenterMock {
        return game.presenter as! GamePresenterMock
    }
    
    override func setUpWithError() throws {
        let presenterMock = GamePresenterMock()
        let boardMock = Board(pieces: [
            [Luke(color: .black), Luke(color: .black)],
            [Luke(color: .white), Luke(color: .white)]
        ])
        game = Game(board: boardMock, presenter: presenterMock)
    }
    
    func test_startGame_input() {
        // given
        XCTAssertEqual(presenterMock.displayBoardCallCount, 0)
        
        // when
        game.start()
        
        // then
        XCTAssertEqual(presenterMock.displayBoardCallCount, 1)
    }
    
    func test_selectPiece_input() {
        // given
        XCTAssertEqual(presenterMock.displayMovablePositionsCallCount, 0)
        
        // when
        game.selectPiece(of: Position(rank: 0, file: 0), userDirection: .south)
        
        // then
        XCTAssertEqual(presenterMock.displayMovablePositionsCallCount, 1)
    }
    
    func test_movePiece_input_to_valid_position() {
        // given
        XCTAssertEqual(presenterMock.displayBoardCallCount, 0)
        XCTAssertEqual(presenterMock.displayScoreCallCount, 0)
        
        // when
        game.movePiece(from: Position(rank: 0, file: 0), to: Position(rank: 1, file: 0), userDirection: .north)
        
        // then
        XCTAssertEqual(presenterMock.displayBoardCallCount, 1)
        XCTAssertEqual(presenterMock.displayScoreCallCount, 1)
    }
    
    func test_movePiece_input_to_invalid_position() {
        // given
        XCTAssertEqual(presenterMock.displayBoardCallCount, 0)
        XCTAssertEqual(presenterMock.displayScoreCallCount, 0)
        
        // when
        game.movePiece(from: Position(rank: 0, file: 0), to: Position(rank: 0, file: 0), userDirection: .north)
        
        // then
        XCTAssertEqual(presenterMock.displayBoardCallCount, 1)
        XCTAssertEqual(presenterMock.displayScoreCallCount, 0)
    }
}

class GamePresenterMock: GamePresentable {
    
    var displayBoardCallCount = 0
    var displayMovablePositionsCallCount = 0
    var displayScoreCallCount = 0
    
    func displayBoard(with snapshot: [[String]]) {
        displayBoardCallCount += 1
    }
    
    func displayMovablePositions(_ positions: [Position]) {
        displayMovablePositionsCallCount += 1
    }
    
    func displayScore(white: Int, black: Int) {
        displayScoreCallCount += 1
    }
}
