import SwiftUI
import ChessLogic

@main
struct ChessGameApp: App {
    let viewModel: GameViewModel
    let game: Game
    
    init() {
        viewModel = GameViewModel()
        game = Game(presenter: viewModel)
        viewModel.listener = game
    }
    
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: viewModel)
        }
    }
}
