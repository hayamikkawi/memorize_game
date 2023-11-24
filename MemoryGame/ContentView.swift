//
//  ContentView.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["😇", "😍", "🥸", "😌"]
    var body: some View {
        VStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😇")
            } else {
                base.foregroundColor(.orange)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
