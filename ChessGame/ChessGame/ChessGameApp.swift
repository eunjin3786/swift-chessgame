import SwiftUI
import ChessLogic

@main
struct ChessGameApp: App {
    
    var body: some Scene {
        WindowGroup {
            gameView
        }
    }
    
    private var gameView: GameView {
        let viewModel = GameViewModel()
        viewModel.listener = Game(presenter: viewModel)
        return GameView(viewModel: viewModel)
    }
}
