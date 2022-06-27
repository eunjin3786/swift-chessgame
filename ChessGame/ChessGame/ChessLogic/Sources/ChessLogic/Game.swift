import Foundation

protocol GameInputListener {
    func start()
    func selectPiece(of position: Position, userDirection: UserDirection)
    func movePiece(from: Position, to: Position, userDirection: UserDirection)
}

protocol GamePresentable {
    func displayBoard(with snapshot: String)
    func displayMovablePositions(_ positions: [Position])
    func displayScore(white: Int, black: Int)
}

class Game {
    private var board: Board
    private var boardMatrix: Int { board.pieces.count }
    
    let presenter: GamePresentable
    
    init(board: Board = Board(), presenter: GamePresentable) {
        self.board = board
        self.presenter = presenter
    }
}

// MARK: - GameInputListener
extension Game: GameInputListener {

    func start() {
        presenter.displayBoard(with: board.snapshot())
    }
    
    func selectPiece(of position: Position, userDirection: UserDirection) {
        let piece = board.piece(of: position)
        let positions = piece?.movablePositions(currentPosition: position, currentUserDirection: userDirection, boardMatrix: boardMatrix) ?? []
        presenter.displayMovablePositions(positions)
    }
    
    func movePiece(from: Position, to: Position, userDirection: UserDirection) {
        let isMoved = board.move(from: from, to: to, userDirection: userDirection)
        if isMoved {
            presenter.displayBoard(with: board.snapshot())
            presenter.displayScore(white: board.score(of: .white), black: board.score(of: .black))
        } else {
            presenter.displayBoard(with: board.snapshot())
        }
    }
}
