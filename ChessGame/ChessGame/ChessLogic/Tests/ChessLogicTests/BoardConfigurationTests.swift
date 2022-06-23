import XCTest
@testable import ChessLogic

class BoardConfigurationTests: XCTestCase {
    
    func test_board_should_be_initialized_8x8() {
        // given
        let board = Board()
        
        // then
        XCTAssertEqual(board.pieces.count, 8)
        for piece in board.pieces {
            XCTAssertEqual(piece.count, 8)
        }
    }
    
    func test_board_should_be_initialiazed_with_pieces() {
        // given
        let board = Board()
        
        // when
        let initialDisplayText = board.display(by: 8)
        
        // then
        let expected =
        """
        ♜♞♝.♛♝♞♜
        ♟♟♟♟♟♟♟♟
        ........
        ........
        ........
        ........
        ♙♙♙♙♙♙♙♙
        ♖♘♗.♕♗♘♖
        """
        XCTAssertEqual(initialDisplayText, expected)
    }
}
