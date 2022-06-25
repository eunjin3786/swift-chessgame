import Foundation
import XCTest
@testable import ChessLogic

class PositionTests: XCTestCase {
    
    func test_position_move_left_up() {
        // given
        let position = Position(file: 0, rank: 0)
        
        // when
        let leftUp = position.left().up()
        
        // then
        let expected = Position(file: position.file - 1, rank: position.rank - 1)
        XCTAssertEqual(leftUp, expected)
    }
    
    func test_position_move_left_down() {
        // given
        let position = Position(file: 0, rank: 0)
        
        // when
        let leftDown = position.left().down()
        
        // then
        let expected = Position(file: position.file + 1, rank: position.rank - 1)
        XCTAssertEqual(leftDown, expected)
    }
    
    func test_position_move_right_up() {
        // given
        let position = Position(file: 0, rank: 0)
        
        // when
        let rightUp = position.right().up()
        
        // then
        let expected = Position(file: position.file - 1, rank: position.rank + 1)
        XCTAssertEqual(rightUp, expected)
    }
    
    func test_position_move_right_down() {
        // given
        let position = Position(file: 0, rank: 0)
        
        // when
        let rightDown = position.right().down()
        
        // then
        let expected = Position(file: position.file + 1, rank: position.rank + 1)
        XCTAssertEqual(rightDown, expected)
    }
}
