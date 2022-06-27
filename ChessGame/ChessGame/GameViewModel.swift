import Foundation
import ChessLogic

class GameViewModel: ObservableObject {
    @Published var boardSnapshot: [[String]] = []
    @Published var movablePositions: [Position] = []
    
    var listener: GameInputListener?

    func startGame() {
        listener?.start()
    }
    
    func selectPiece(of position: Position, userDirection: UserDirection) {
        listener?.selectPiece(of: position, userDirection: userDirection)
    }
    
    func movePiece(from: Position, to: Position, userDirection: UserDirection) {
        listener?.movePiece(from: from, to: to, userDirection: userDirection)
    }
}

extension GameViewModel: GamePresentable {
    
    func displayBoard(with snapshot: [[String]]) {
        boardSnapshot = snapshot
    }
    
    func displayMovablePositions(_ positions: [Position]) {
        movablePositions = movablePositions
    }
    
    func displayScore(white: Int, black: Int) {
        // TODO:
    }
}
