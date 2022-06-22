//
//  ContentView.swift
//  Chessgame
//
//  Created by yeolmaecode on 2022/06/20.
//

import SwiftUI

struct ContentView: View {
    
    let chessboard = Board()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
