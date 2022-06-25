import XCTest
@testable import ChessLogic

class BoardConfigurationTests: XCTestCase {

    func test_board_config_with_default_pieces() {
        // given
        let board = Board()
        
        // when
        let initialDisplayText = board.snapshot()
        
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
    
    func test_board_config_with_custom_pieces() {
        // given
        let board = Board(pieces: [
            [Luke(color: .white), Knight(color: .white)],
            [Luke(color: .black), Knight(color: .black)]
        ])
        
        // when
        let displayText = board.snapshot()
        
        // then
        let expected =
        """
        ♖♘
        ♜♞
        """
        XCTAssertEqual(displayText, expected)
    }
}
