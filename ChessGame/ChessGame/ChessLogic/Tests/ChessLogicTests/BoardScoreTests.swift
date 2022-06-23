import XCTest
@testable import ChessLogic

class BoardScoreTests: XCTestCase {
    
    func test_score_with_custom_pieces() {
        // given
        let whitePieces: [Piece] = [
            Luke(color: .white), Knight(color: .white)
        ]
        let blackPieces: [Piece] = [
            Queen(color: .black), Luke(color: .black)
        ]
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
    
    func test_score_when_pieces_is_empty() {
        // given
        let board = Board(pieces: [])
        
        // when
        let whiteScore = board.score(of: .white)
        let blackScore = board.score(of: .black)
        
        // then
        XCTAssertEqual(whiteScore, 0)
        XCTAssertEqual(blackScore, 0)
    }
}
