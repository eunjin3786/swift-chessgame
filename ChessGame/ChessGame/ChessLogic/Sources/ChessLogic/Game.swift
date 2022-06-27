import Foundation

public protocol GameInputListener {
    func start()
    func selectPiece(of position: Position, player: PlayerInfo)
    func movePiece(from: Position, to: Position, player: PlayerInfo)
}

public protocol GamePresentable {
    func displayBoard(with snapshot: [[String]])
    func displayMovablePositions(_ positions: [Position])
    func displayScore(white: Int, black: Int)
}

public struct PlayerInfo {
    let direction: UserDirection
    let color: Color
    
    public init(direction: UserDirection, color: Color) {
        self.direction = direction
        self.color = color
    }
}

public class Game {
    private var board: Board
    private var boardMatrix: Int { board.pieces.count }
    
    let presenter: GamePresentable
    
    public init(presenter: GamePresentable) {
        self.board = Board()
        self.presenter = presenter
    }
    
    init(board: Board, presenter: GamePresentable) {
        self.board = board
        self.presenter = presenter
    }
}

// MARK: - GameInputListener
extension Game: GameInputListener {

    public func start() {
        presenter.displayBoard(with: board.snapshot())
    }
    
    public func selectPiece(of position: Position, player: PlayerInfo) {
        guard let piece = board.piece(of: position), piece.color == player.color else { return }
        let positions = piece.movablePositions(currentPosition: position, currentUserDirection: player.direction, boardMatrix: boardMatrix)
        presenter.displayMovablePositions(positions)
    }
    
    public func movePiece(from: Position, to: Position, player: PlayerInfo) {
        let isMoved = board.move(from: from, to: to, userDirection: player.direction)
        if isMoved {
            presenter.displayBoard(with: board.snapshot())
            presenter.displayScore(white: board.score(of: .white), black: board.score(of: .black))
        } else {
            presenter.displayBoard(with: board.snapshot())
        }
    }
}
