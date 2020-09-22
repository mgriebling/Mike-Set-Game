//
//  Cardify.swift
//  Memorize
//
//  Created by Mike Griebling on 2020-09-18.
//  Copyright © 2020 Computer Inspirations. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
 
    var isTouched: Bool
    var rotation: Double
    
    init(isFaceUp: Bool, isTouched: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.isTouched = isTouched
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
    private let edgeLineWidth: CGFloat = 2
    
}

extension View {
    
    func cardify(isFaceUp: Bool, isTouched: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isTouched: isTouched))
    }
    
}
