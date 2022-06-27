import Foundation

public enum UserDirection {
    case north
    case south
}

public struct Position: Equatable {
    public let rank: Int // 가로
    public let file: Int // 세로
    
    public init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
    }
    
    func up() -> Position {
        return Position(rank: rank - 1, file: file)
    }
    
    func down() -> Position {
        return Position(rank: rank + 1, file: file)
    }
    
    func left() -> Position {
        return Position(rank: rank, file: file - 1)
    }
    
    func right() -> Position {
        return Position(rank: rank, file: file + 1)
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
   
