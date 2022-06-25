import XCTest
@testable import ChessLogic

class PieceTests: XCTestCase {
    
    func test_movable_positions_of_luke() {
        // given
        let blackLuke = Luke(color: .black)
        let whiteLuke = Luke(color: .white)

        // when
        let black = blackLuke.movablePositions(currentPosition: Position(file: 0, rank: 0), currentUserDirection: .north, boardMatrix: 2)
        let white = whiteLuke.movablePositions(currentPosition: Position(file: 1, rank: 0), currentUserDirection: .south, boardMatrix: 2)
        
        // then
        XCTAssertEqual(black, [Position(file: 1, rank: 0)])
        XCTAssertEqual(white, [Position(file: 0, rank: 0)])
    }
    
    func test_movable_positions_of_pawn() {
        // given
        let blackPawn = Pawn(color: .black)
        let whitePawn = Pawn(color: .white)

        // when
        let black = blackPawn.movablePositions(currentPosition: Position(file: 0, rank: 0), currentUserDirection: .north, boardMatrix: 2)
        let white = whitePawn.movablePositions(currentPosition: Position(file: 1, rank: 0), currentUserDirection: .south, boardMatrix: 2)
        
        // then
        XCTAssertEqual(black, [Position(file: 1, rank: 0)])
        XCTAssertEqual(white, [Position(file: 0, rank: 0)])
    }
    
    func test_movable_positions_of_knight() {
        // given
        let blackKnight = Knight(color: .black)
        let whiteKnight = Knight(color: .white)

        // when
        let black = blackKnight.movablePositions(currentPosition: Position(file: 0, rank: 0), currentUserDirection: .north, boardMatrix: 2)
        let white = whiteKnight.movablePositions(currentPosition: Position(file: 1, rank: 0), currentUserDirection: .south, boardMatrix: 2)
        
        // then
        XCTAssertEqual(black, [Position(file: 0, rank: 1)])
        XCTAssertEqual(white, [Position(file: 1, rank: 1)])
    }
    
    func test_movable_positions_of_bishop() {
        // given
        let blackBishop = Bishop(color: .black)
        let whiteBishop = Bishop(color: .white)

        // when
        let black = blackBishop.movablePositions(currentPosition: Position(file: 0, rank: 0), currentUserDirection: .north, boardMatrix: 2)
        let white = whiteBishop.movablePositions(currentPosition: Position(file: 1, rank: 0), currentUserDirection: .south, boardMatrix: 2)
        
        // then
        XCTAssertEqual(black, [Position(file: 1, rank: 1)])
        XCTAssertEqual(white, [Position(file: 0, rank: 1)])
    }
    
    func test_movable_positions_of_queen() {
        // given
        let blackQueen = Queen(color: .black)
        let whiteQueen = Queen(color: .white)

        // when
        let black = blackQueen.movablePositions(currentPosition: Position(file: 0, rank: 0), currentUserDirection: .north, boardMatrix: 2)
        let white = whiteQueen.movablePositions(currentPosition: Position(file: 1, rank: 0), currentUserDirection: .south, boardMatrix: 2)
        
        // then
        XCTAssertEqual(black, [
            Position(file: 1, rank: 0),
            Position(file: 1, rank: 1)]
        )
        
        XCTAssertEqual(white, [
            Position(file: 0, rank: 0),
            Position(file: 0, rank: 1)
        ])
    }
}
