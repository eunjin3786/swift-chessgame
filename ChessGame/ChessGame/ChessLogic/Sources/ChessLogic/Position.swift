import Foundation

enum UserDirection {
    case north
    case south
}

struct Position: Equatable {
    let file: Int
    let rank: Int
    
    func up() -> Position {
        return Position(file: file - 1, rank: rank)
    }
    
    func down() -> Position {
        return Position(file: file + 1, rank: rank)
    }
    
    func left() -> Position {
        return Position(file: file, rank: rank - 1)
    }
    
    func right() -> Position {
        return Position(file: file, rank: rank + 1)
    }
}

extension Piece {
    
    func movablePositions(currentPosition: Position, currentUserDirection: UserDirection, boardMatrix: Int) -> [Position] {
        var positions: [Position] = []
        
        for direction in moveDirections {
            positions += movablePositions(
                moveDirection: direction,
                position: currentPosition,
                userDirection: currentUserDirection,
                boardMatrix: boardMatrix
            )
        }
        
        return positions
    }

    private func movablePositions(moveDirection: MoveDirection, position: Position, userDirection: UserDirection, boardMatrix: Int) -> [Position] {
        var positions: [Position] = []
        
        switch moveDirection {
        case .forward:
            switch userDirection {
            case .north:
                positions = [position.down()]
            case .south:
                positions = [position.up()]
            }
        case .cross:
            positions = [
                position.left().up(),
                position.left().down(),
                position.right().up(),
                position.right().down()
            ]
        case .forwardThenCross:
            switch userDirection {
            case .north:
                positions = [
                    position.down().left().up(),
                    position.down().left().down(),
                    position.down().right().up(),
                    position.down().right().down()
                ]
            case .south:
                positions = [
                    position.up().left().up(),
                    position.up().left().down(),
                    position.up().right().up(),
                    position.up().right().down()
                ]
            }
        }
        
        return positions.filter { isInBoundary(position: $0, boardMatrix: boardMatrix) }
    }
    
    private func isInBoundary(position: Position, boardMatrix: Int) -> Bool {
        return 0..<boardMatrix ~= position.file && 0..<boardMatrix ~= position.rank
    }
}
   
