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
            HStack {
                Spacer()
                Button("Deal 3 ") {
                    withAnimation(.easeInOut) {
                        viewModel.deal(cards: 3)
//                        viewModel.newGame()
                    }
                }
             //   .padding()
            }
//            Text(viewModel.title).font(.title).bold()
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        viewModel.touch(card: card)
                    }
                }
                .padding(3)
            }
            //.padding()
 //           .foregroundColor(viewModel.colour.first)
            Text("Score: \(viewModel.score)")
                .font(Font.title).bold()
                .foregroundColor(.red)
                //.padding()
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
    
    private func isVisible(max: Int, id: Int) -> Bool {
        if max == 1 && id == 1 { return true }
        if max == 2 && (id == 0 || id == 2) { return true }
        if max == 3 { return true }
        return false
    }
    
    // @ViewBuilder
    private func body(for size: CGSize) -> some View {
        let colour = card.content.rgbColor
        let number = card.content.number
        let height = (size.height-20) / 3
        return VStack(spacing:5) {
            ForEach(0 ..< number)  { id in
                Group {
                    if card.content.shade == .none {
                        SetShape3(shape: card.content.shape)
                            .stroke(colour, lineWidth: 2)
                    } else if card.content.shade == .solid {
                        SetShape3(shape: card.content.shape)
                            .fill(colour)
                    } else {
                        ZStack {
                            SetShape3(shape: card.content.shape)
                                .fill(colour.opacity(0.4))
                            SetShape3(shape: card.content.shape)
                                .stroke(colour, lineWidth: 2)
                        }
                    }
                }
                .frame(height: height)
            }
            .aspectRatio(CGSize(width: 6, height: 3), contentMode: .fit)
        }
        .cardify(isFaceUp: true, isTouched: card.isTouched)
        .transition(AnyTransition.scale)
    }
    
    // MARK: - Drawing Constants
    private func font(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Shape3SetGame()
        model.deal(cards: 15)
        return Group {
            Shape3SetGameView(viewModel: model)
            Shape3SetGameView(viewModel: model)
        }
    }
}
