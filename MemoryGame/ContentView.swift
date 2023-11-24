//
//  ContentView.swift
//  MemoryGame
//
//  Created by Haya Mikkawi on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var theme: Theme = .halloween
    var body: some View {
        VStack {
            Title()
            ScrollView {
                Cards(theme: theme)
            }
            ThemeButtons(setTheme: { newTheme in
                theme = newTheme
            })
        }
    }
}

struct Title: View {
    var body: some View {
        Text("Memorize!")
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .padding()
    }
}

struct Cards: View {
    let theme: Theme
    var body: some View {
        let emojis = (theme.emojies + theme.emojies).shuffled()
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(isFaceUp: false,
                         color: theme.color,
                         content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }.padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let color: Color
    let content: String
    var body: some View {
        ZStack {
            // face down
            let base = RoundedRectangle(cornerRadius: 12)
            // face up
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }.foregroundColor(color)
    }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
