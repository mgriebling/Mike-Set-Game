//
//  Cardify.swift
//  Memorize
//
//  Created by Mike Griebling on 2020-09-18.
//  Copyright © 2020 Computer Inspirations. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
 
    var colour: Color
    var rotation: Double
    
    init(isFaceUp: Bool, colour: Color) {
        rotation = isFaceUp ? 0 : 180
        self.colour = colour
    }
    
    var isFaceUp: Bool { rotation < 90 }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
       ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
            .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
}

extension View {
    
    func cardify(isFaceUp: Bool, colour: Color) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, colour: colour))
    }
    
}
