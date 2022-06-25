import XCTest
@testable import ChessLogic

class BoardMoveTests: XCTestCase {
    
    func test_get_piece_with_valid_positions() {
        // given
        let board = Board(pieces: [
            [Luke(color: .black), Queen(color: .black)],
            [Luke(color: .white), Queen(color: .white)]
        ])
        
        // then
        let piece1 = board.piece(of: Position(x: 0, y: 1))
        XCTAssertNotNil(piece1 as? Queen)
        XCTAssertEqual(piece1?.color, .black)
        
        let piece2 = board.piece(of: Position(x: 1, y: 0))
        XCTAssertNotNil(piece2 as? Luke)
        XCTAssertEqual(piece2?.color, .white)
    }
    
    func test_get_piece_with_invalid_positions() {
        // given
        let board = Board(pieces: [
            [Luke(color: .black), Queen(color: .black)],
            [Luke(color: .white), Queen(color: .white)]
        ])
        
        // then
        let piece1 = board.piece(of: Position(x: 2, y: 1))
        XCTAssertNil(piece1)
        
        let piece2 = board.piece(of: Position(x: -1, y: 0))
        XCTAssertNil(piece2)
    }
}
