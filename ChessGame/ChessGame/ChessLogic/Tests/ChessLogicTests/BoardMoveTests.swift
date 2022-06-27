import XCTest
@testable import ChessLogic

class BoardMoveTests: XCTestCase {
    
    // MARK: - Get Piece
    func test_get_piece_with_valid_positions() {
        // given
        let board = Board(pieces: [
            [Luke(color: .black), Queen(color: .black)],
            [Luke(color: .white), Queen(color: .white)]
        ])
        
        // then
        let piece1 = board.piece(of: Position(rank: 0, file: 1))
        XCTAssertNotNil(piece1 as? Queen)
        XCTAssertEqual(piece1?.color, .black)
        
        let piece2 = board.piece(of: Position(rank: 1, file: 0))
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
        let piece1 = board.piece(of: Position(rank: 2, file: 1))
        XCTAssertNil(piece1)
        
        let piece2 = board.piece(of: Position(rank: -1, file: 0))
        XCTAssertNil(piece2)
    }
    
    // MARK: - Move Piece
    func test_move_should_be_failed_to_same_color() {
        // given
        var board = Board(pieces: [
            [Luke(color: .black), Queen(color: .black)],
            [Luke(color: .black), Queen(color: .white)]
        ])
        let initialSnapshot: String = board.snapshot()
        
        // when
        let isMoved = board.move(from: Position(rank: 0, file: 0), to: Position(rank: 0, file: 1), userDirection: .north)

        // then
        XCTAssertFalse(isMoved)
        XCTAssertEqual(board.snapshot(), initialSnapshot)
    }

    func test_move_should_be_succeed_to_different_color() {
        // given
        var board = Board(pieces: [
            [Luke(color: .black), Queen(color: .black)],
            [Luke(color: .white), Queen(color: .white)]
        ])

        // when
        let isMoved = board.move(from: Position(rank: 1, file: 0), to: Position(rank: 0, file: 0), userDirection: .south)
        let snapshot: String = board.snapshot()
        
        // then
        XCTAssertTrue(isMoved)
        
        let expected = Board(pieces: [
            [Luke(color: .white), Queen(color: .black)],
            [nil, Queen(color: .white)]
        ])
        XCTAssertEqual(snapshot, expected.snapshot())
    }
}
