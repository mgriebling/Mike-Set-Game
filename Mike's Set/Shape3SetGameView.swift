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
            .padding()
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
    
    // @ViewBuilder
    private func body(for size: CGSize) -> some View {
        let colour = card.content.rgbColor
        let number = card.content.number
        let shade = card.content.shade
        let height = size.height/4
//        let width  = height*2
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
                .frame(height: height)
            }
        // .frame(width: width, height: size.height, alignment: .center)
//            .aspectRatio(CGSize(width: 3, height: 2), contentMode: .fill)
        }
        .cardify(isFaceUp: true, isTouched: card.isTouched)
        .frame(width: 2*height, height: 3*height)
        // .aspectRatio(2/3, contentMode: .fit)
        .transition(AnyTransition.scale)
    }
    
    // MARK: - Drawing Constants
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Shape3SetGame()
        model.deal(cards: 7)
        return Group {
            Shape3SetGameView(viewModel: model)
                .previewDevice("iPad Air (4th generation)")
        }
    }
}
