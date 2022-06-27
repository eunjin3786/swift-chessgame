import Foundation

public protocol GameInputListener: AnyObject {
    func start()
    func selectPiece(of position: Position, userDirection: UserDirection)
    func movePiece(from: Position, to: Position, userDirection: UserDirection)
}

public protocol GamePresentable {
    func displayBoard(with snapshot: [[String]])
    func displayMovablePositions(_ positions: [Position])
    func displayScore(white: Int, black: Int)
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
    
    public func selectPiece(of position: Position, userDirection: UserDirection) {
        let piece = board.piece(of: position)
        let positions = piece?.movablePositions(currentPosition: position, currentUserDirection: userDirection, boardMatrix: boardMatrix) ?? []
        presenter.displayMovablePositions(positions)
    }
    
    public func movePiece(from: Position, to: Position, userDirection: UserDirection) {
        let isMoved = board.move(from: from, to: to, userDirection: userDirection)
        if isMoved {
            presenter.displayBoard(with: board.snapshot())
            presenter.displayScore(white: board.score(of: .white), black: board.score(of: .black))
        } else {
            presenter.displayBoard(with: board.snapshot())
        }
    }
}
