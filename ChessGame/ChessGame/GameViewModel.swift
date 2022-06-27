import Foundation
import ChessLogic

struct ViewPosition: Equatable {
    let row: Int
    let column: Int
}

class GameViewModel: ObservableObject {
    @Published var boardSnapshot: [[String]] = []
    @Published var higlightedPositions: [ViewPosition] = []
    
    var player1 = PlayerInfo(direction: .north, color: .black)
    var player2 = PlayerInfo(direction: .south, color: .white)
    
    var currentPlayer: PlayerInfo?
    
    var listener: GameInputListener?

    func startGame() {
        currentPlayer = player1
        listener?.start()
    }
    
    func selectPiece(of position: ViewPosition) {
        guard let player = currentPlayer else { return }
        listener?.selectPiece(of: position.converted(), player: player)
    }
    
    func movePiece(from: ViewPosition, to: ViewPosition) {
        guard let player = currentPlayer else { return }
        listener?.movePiece(from: from.converted(), to: to.converted(), player: player)
    }
    
    func element(of position: ViewPosition) -> String {
        return boardSnapshot[safe: position.row]?[safe: position.column] ?? ""
    }
}

extension GameViewModel: GamePresentable {
    
    func displayBoard(with snapshot: [[String]]) {
        boardSnapshot = snapshot
    }
    
    func displayMovablePositions(_ positions: [Position]) {
        higlightedPositions = positions.map { $0.converted() }
    }
    
    func displayScore(white: Int, black: Int) {
        // TODO:
    }
}

extension ViewPosition {
    
    func converted() -> Position {
        return Position(rank: row, file: column)
    }
}

extension Position {
    
    func converted() -> ViewPosition {
        return ViewPosition(row: rank, column: file)
    }
}
