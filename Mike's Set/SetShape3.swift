//
//  SetShape3.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-20.
//

import SwiftUI

struct SetShape3: Shape {
    
    // shape to be drawn
    private var shape: ShapeType
    
    init(shape: ShapeType) {
        self.shape = shape
    }
    
    func path(in rect: CGRect) -> Path {
        var p : Path
        switch shape {
        case .oval: p = Capsule(style: .circular).path(in: rect)
        case .diamond: p = Diamond().path(in: rect)
        case .squiggle: p = Squiggle().path(in: rect)
        }
        return p
    }
    
}

