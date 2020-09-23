//
//  Shape3SetGameView.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

extension CGImage {
    
    static func generateStripePattern(
        colors: (UIColor, UIColor) = (.clear, .black),
        width: CGFloat = 6,
        ratio: CGFloat = 1) -> CGImage? {
        
        let context = CIContext()
        let stripes = CIFilter.stripesGenerator()
        stripes.color0 = CIColor(color: colors.0)
        stripes.color1 = CIColor(color: colors.1)
        stripes.width = Float(width)
        stripes.center = CGPoint(x: 1-width*ratio, y: 0)
        let size = CGSize(width: width, height: 1)
        
        guard
            let stripesImage = stripes.outputImage,
            let image = context.createCGImage(stripesImage, from: CGRect(origin: .zero, size: size))
        else { return nil }
        return image
    }
    
}

extension Shape {

    func stripes(angle: Double = 45, colour: Color = .black) -> AnyView {
        let stripeColor = UIColor(colour)
        guard
            let stripePattern = CGImage.generateStripePattern(colors: (.clear, stripeColor))
        else { return AnyView(self)}

        return AnyView(Rectangle().fill(ImagePaint(
            image: Image(decorative: stripePattern, scale: 1.0)))
        .scaleEffect(2)
        .rotationEffect(.degrees(angle))
        .clipShape(self))
    }
}

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
        let height = size.height / 4
        let width = min(size.width, height*1.7)
//        print(size.height, size.width)
        return VStack() {
            ForEach(0 ..< number)  { id in
                ZStack {
                    if shade == .hatched {
                        SetShape3(shape: card.content.shape)
                            .stripes(angle: 0, colour: colour)
                    } else {
                        SetShape3(shape: card.content.shape)
                            .fill(colour.opacity(shade == .none ? 0 : shade == .solid ? 1 : 0.3))
                    }
                    SetShape3(shape: card.content.shape)
                        .stroke(colour, lineWidth: 3)
                }
                .frame(width: width, height: height, alignment: .center)
            }
            //.aspectRatio(CGSize(width: 3, height: 2), contentMode: .fit)
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
        model.deal(cards: 7)
        return Group {
            Shape3SetGameView(viewModel: model)
                .previewDevice("iPad Air (4th generation)")
        }
    }
}
