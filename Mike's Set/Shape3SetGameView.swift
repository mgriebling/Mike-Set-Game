//
//  Shape3SetGameView.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import SwiftUI

struct Shape3SetGameView: View {
    @ObservedObject var viewModel: Shape3SetGame
    
    var body: some View {
        VStack {
            Text("Mike's Set Game").font(.title).bold()
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        viewModel.touch(card: card)
                    }
                }
                .padding(5)
            }
            .padding(5)
            HStack(alignment: .firstTextBaseline) {
                Spacer()
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(Font.title).bold()
                    .foregroundColor(.red)
                    .padding(.bottom)
                Spacer()
                Button("Deal 3") {
                    withAnimation(.easeInOut) {
                        viewModel.deal(cards: 3)
                    }
                }
                .padding(.trailing)
            }
        }
    }
}

struct CardView: View {
    var card: SetGame<Theme3, CardContent>.Card

    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    // @ViewBuilder
    private func body(for size: CGSize) -> some View {
        let colour = card.content.rgbColor
        let number = card.content.number
        let shade = card.content.shade
        let height = min(size.height/4, size.width/3)
        return VStack() {
            ForEach(0 ..< number)  { id in
                ZStack {
                    if shade == .hatched {
                        SetShape3(shape: card.content.shape)
                            .stripes(angle: 0, colour: colour)
                    } else {
                        SetShape3(shape: card.content.shape)
                            .fill(colour.opacity(shade == .solid ? 1 : 0))
                    }
                    SetShape3(shape: card.content.shape)
                        .stroke(colour, lineWidth: 3)
                }
                .frame(width: 2*height, height: height)
            }
        }
        .cardify(isFaceUp: true, isTouched: card.isTouched)
        .aspectRatio(2/3, contentMode: .fit)
        .transition(AnyTransition.scale)
    }
    
    // MARK: - Drawing Constants
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Shape3SetGame()
        model.deal(cards: 15)
        return Group {
            Shape3SetGameView(viewModel: model)
                .previewDevice("iPad Touch (7th generation)")
        }
    }
}
