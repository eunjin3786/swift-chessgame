import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var boardView: some View {
        VStack {
            ForEach(0..<viewModel.boardSnapshot.count, id: \.self) { row in
                HStack {
                    ForEach(0..<viewModel.boardSnapshot[row].count, id: \.self) { column in
                        let position = ViewPosition(row: row, column: column)
                        let element = viewModel.element(of: position)
                        let shouldHighlighted = viewModel.higlightedPositions.contains(position)
                        
                        Text(element).frame(width: 20, height: 20)
                            .background(shouldHighlighted ? Color.blue : Color.clear)
                            .onTapGesture {
                                viewModel.selectPiece(of: position)
                            }
                    }
                }
            }
        }
    }
    
    var body: some View {
        boardView.onAppear {
            viewModel.startGame()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
