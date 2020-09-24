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
    var isVisible: Bool
    var rotation: Double
    
    init(isFaceUp: Bool, isTouched: Bool, isVisible: Bool) {
        rotation = isFaceUp ? 0 : 180
        self.isTouched = isTouched
        self.isVisible = isVisible
    }
    
    var isFaceUp: Bool { rotation < 90 }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    private func random() -> CGFloat {
        return 10.0 * CGFloat.random(in: -1000...1000)
    }
    
    func body(content: Content) -> some View {
       ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    .shadow(color: isTouched ? Color.black : .clear, radius: shadowRadius)
                    .animation(.linear)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
            .opacity(isFaceUp ? 0 : 1)
        }
        .offset(x: isVisible ? 0 : random(), y: isVisible ? .zero : random())
        .animation(.easeInOut(duration: 2))
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
    
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let shadowRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 2
    
}

extension View {
    
    func cardify(isFaceUp: Bool, isTouched: Bool, isVisible: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isTouched: isTouched, isVisible: isVisible))
    }
    
}
