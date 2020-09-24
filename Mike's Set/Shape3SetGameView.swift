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
                    withAnimation(.linear) {
                        viewModel.touch(card: card)
                    }
                }
        
                //.transition(.offset(x: visible ? 0 : 10000, y: visible ? 0 : 10000))
                .padding(5)
            }
            .padding(5)
            .transition(.scale)
            HStack(alignment: .firstTextBaseline) {
                Button("New Game") {
                    withAnimation(.easeInOut) {
                        viewModel.newGame()
                    }
                }
                Text("Score: \(viewModel.score)")
                    .font(Font.title).bold()
                    .foregroundColor(.red)
                    .padding(.bottom)
                Button("Deal 3 Cards") {
                    viewModel.deal(cards: 3)
                    withAnimation(Animation.easeInOut) {
                        viewModel.makeVisible()
                    }
                }
            }
        }
        .onAppear {
            viewModel.deal(cards: 12)
            withAnimation(Animation.easeInOut(duration: 2).delay(1)) {
                viewModel.makeVisible()
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
    
    private func random() -> CGFloat {
        CGFloat.random(in: CGFloat.greatestFiniteMagnitude/2...CGFloat.greatestFiniteMagnitude)
    }
    
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
//        .transition(.offset(x: card.isVisible ? 0 : 10000, y: card.isVisible ? 0 : 10000))
//        .animation(.easeInOut(duration: 1))
        // .offset(card.visible ? CGPoint.zero : CGPoint(x: 1000, y: 1000))
        .cardify(isFaceUp: true, isTouched: card.isTouched, isVisible: card.isVisible)
        .aspectRatio(2/3, contentMode: .fit)

        //.transition(AnyTransition.offset(x: card.isVisible ? 0 : 15000, y: card.isVisible ? 0 : 15000).animation(.easeIn(duration: 3)))
        //.transition(AnyTransition.scale)
    }
    
    // MARK: - Drawing Constants
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Shape3SetGame()
        return Group {
            Shape3SetGameView(viewModel: model)
                .previewDevice("iPad Touch (7th generation)")
        }
    }
}
