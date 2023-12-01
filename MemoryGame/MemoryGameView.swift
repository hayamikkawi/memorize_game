//
//  MemoryGameView.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 19/11/2023.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: EmojieMemoryGame
    
    @State var theme: Theme = .halloween
    var body: some View {
        VStack {
            title
            ScrollView {
                cards
            }
            Button("shuffle") {
                viewModel.shuffle()
            }
            ThemeButtons(setTheme: { newTheme in
                theme = newTheme
            })
        }
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }.padding()
    }
    
    struct ThemeButtons: View {
        var setTheme: (Theme) -> Void
        var body: some View {
            let themes = Theme.allCases
            HStack {
                ForEach(themes.indices, id: \.self) { index in
                    ThemeButton(buttonTheme: themes[index],
                                setTheme: setTheme)
                    if index < themes.count - 1 {
                        Spacer()
                    }
                }
            }.padding()
        }
    }
    
    struct ThemeButton: View {
        let buttonTheme: Theme
        var setTheme: (Theme) -> Void
        var body: some View {
            Button(action: {
                setTheme(buttonTheme)
            },
                   label: {
                VStack {
                    Image(systemName: buttonTheme.icon)
                    Text(buttonTheme.title)
                }
                .imageScale(.large)
                .font(.body)
            })
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card ) {
        self.card = card
    }
    var body: some View {
        ZStack {
            // face down
            let base = RoundedRectangle(cornerRadius: 12)
            // face up
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: EmojieMemoryGame())
    }
}
