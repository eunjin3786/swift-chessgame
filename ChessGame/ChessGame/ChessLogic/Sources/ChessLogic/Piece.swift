import Foundation

enum Color {
    case white
    case black
}

enum MoveDirection {
    case forward
    case cross
    case forwardThenCross
}

protocol Piece {
    var score: Int { get }
    var color: Color { get }
    var displayString: String { get }
    var moveDirections: [MoveDirection] { get }
}
                     
struct Pawn: Piece {
    let score: Int = 1
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♙"
        case .black:
            return "♟"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward]
    }
}

struct Bishop: Piece {
    let score: Int = 3
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♗"
        case .black:
            return "♝"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.cross]
    }
}

struct Knight: Piece {
    let score: Int = 3
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♘"
        case .black:
            return "♞"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forwardThenCross]
    }
}

struct Luke: Piece {
    let score: Int = 5
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♖"
        case .black:
            return "♜"
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward]
    }
}

struct Queen: Piece {
    let score: Int = 9
    let color: Color
    
    var displayString: String {
        switch color {
        case .white:
            return "♕" // U+2655
        case .black:
            return "♛" // U+265B
        }
    }
    
    var moveDirections: [MoveDirection] {
        return [.forward, .cross]
    }
}
