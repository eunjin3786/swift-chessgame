import XCTest
@testable import ChessLogic

class BoardScoreTests: XCTestCase {
    
    func test_score() {
        // given
        let whitePieces: [Piece] = [Luke(color: .white), Knight(color: .white)]
        let blackPieces: [Piece] = [Queen(color: .black), Luke(color: .black)]
        let board = Board(pieces: [
            whitePieces,
            blackPieces
        ])
        
        // when
        let whiteScore = board.score(of: .white)
        let blackScore = board.score(of: .black)
        
        // then
        let whiteExpected = whitePieces.map { $0.score }.reduce(0, +)
        let blackExpected = blackPieces.map { $0.score }.reduce(0, +)
        
        XCTAssertEqual(whiteScore, whiteExpected)
        XCTAssertEqual(blackScore, blackExpected)
    }
}
