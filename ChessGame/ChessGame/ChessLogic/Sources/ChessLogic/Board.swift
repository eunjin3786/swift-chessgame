import Foundation

struct BoardConfig {
    
    static var _8by8: [[Piece?]] {
        
        func firstLine(color: Color) -> [Piece?] {
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
    private(set) var pieces: [[Piece?]]
    
    init(pieces: [[Piece?]] = BoardConfig._8by8) {
        self.pieces = pieces
    }
    
    func snapshot() -> String {
        var fullText = ""
        for i in 0..<pieces.count {
            let text = pieces[i].map { $0?.displayString ?? "." }.reduce("", +)
            fullText += text
            fullText += i == pieces.count - 1 ? "" : "\n"
        }
        return fullText
    }
    
    func display() -> String {
        return snapshot()
    }
    
    func score(of color: Color) -> Int {
        return pieces.flatMap { $0 }
            .filter { $0?.color == color }
            .map { $0?.score ?? 0 }
            .reduce(0, +)
    }
    
    mutating func move(from: Position, to: Position, userDirection: UserDirection) -> Bool {
        if isValidMovement(from: from, to: to, userDirection: userDirection) {
            pieces[to.file][to.rank] = pieces[from.file][from.rank]
            pieces[from.file][from.rank] = nil
            return true
        } else {
            return false
        }
    }
    
    func isValidMovement(from: Position, to: Position, userDirection: UserDirection) -> Bool {
        guard let fromPiece = piece(of: from) else { return false }
        let movablePositions =  fromPiece.movablePositions(currentPosition: from, currentUserDirection: userDirection, boardMatrix: pieces.count)
        guard movablePositions.contains(where: { $0 == to }) else { return false }
        
        let toPiece = piece(of: to)
        if let toPiece = toPiece, toPiece.color == fromPiece.color {
            return false
        }
        
        return true
    }
    
    func piece(of position: Position) -> Piece? {
        return pieces[safe: position.file]?[safe: position.rank] ?? nil
    }
}
