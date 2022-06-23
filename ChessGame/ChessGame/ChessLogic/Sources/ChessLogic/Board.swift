import Foundation

struct BoardConfig {
    
    static var _8by8: [[GamePiece?]] {
        
        func firstLine(color: Color) -> [GamePiece?] {
            return [
                Luke(color: color),
                Knight(color: color),
                Bishop(color: color),
                nil,
                Queen(color: color),
                Bishop(color: color),
                Knight(color: color),
                Luke(color: color),
            ]
        }
        
        return [
            firstLine(color: .black),
            Array(repeating: Pawn(color: .black), count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: nil, count: 8),
            Array(repeating: Pawn(color: .white), count: 8),
            firstLine(color: .white)
        ]
    }
}

struct Board {
    
    var pieces: [[GamePiece?]]
    
    init(pieces: [[GamePiece?]]? = nil) {
        self.pieces = pieces ?? BoardConfig._8by8
    }
    
    func display(by matrix: Int) -> String {
        let isInBoundary = pieces.count <= matrix && pieces.map { $0.count }.contains(where: { $0 > matrix }) == false
        guard isInBoundary else { return "" }
        
        var fullText = ""
        
        for i in 0..<matrix {
            if i != 0 {
                fullText += "\n"
            }
            
            for j in 0..<matrix {
                fullText += pieces[i][j]?.displayString ?? "."
            }
        }
        
        return fullText
    }
    
    func move(from: Position, to: Position) -> Bool {
//        TODO: -
//        특정 말을 옮기는 메소드는 Board에서 제공한다.
//        같은 색상의 말이 to 위치에 다른 말이 이미 있으면 옮길 수 없다.
//        말을 옮길 수 있으면 true, 옮길 수 없으면 false를 리턴한다.
//        만약, 다른 색상의 말이 to 위치에 있는 경우는 기존에 있던 말을 제거하고 이동한다.
        return true
    }
}

struct Position {
    let x, y: Int
}
