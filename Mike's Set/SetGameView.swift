//
//  SetGameView.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var viewModel: Shape3SetGame
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Deal 3") {
                    withAnimation(.easeInOut) {
                        viewModel.deal3()
//                        viewModel.newGame()
                    }
                }
                .padding()
            }
//            Text(viewModel.title).font(.title).bold()
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        viewModel.touch(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
 //           .foregroundColor(viewModel.colour.first)
            Text("Score: \(viewModel.score)")
                .font(Font.title).bold()
                .foregroundColor(.red)
                .padding()
        }
    }
}

struct CardView: View {
    var card: SetGame<Theme3, CardContent>.Card
    var theme: Theme3

    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
//    private func startBonusTimeAnimation() {
//        animatedBonusRemaining = card.bonusRemaining
//        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
//            animatedBonusRemaining = 0
//        }
//    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
            SetShape3(theme: theme, number: card.content.number, shape: card.content.shape, fill: card.content.shade, colour: card.content.colour)
            Text("🟦")
                .font(font(for: size))
                .rotationEffect(Angle.degrees(card.isTouched ? 360: 0))
                .animation(card.isTouched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
        .cardify(isFaceUp: !card.isTouched, colour: Color.blue)
        .transition(AnyTransition.scale)
    }
    
    // MARK: - Drawing Constants
    private func font(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.7)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetGameView(viewModel: Shape3SetGame())
    }
}
