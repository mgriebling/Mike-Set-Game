//
//  SetShape3.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-20.
//

import SwiftUI

struct SetShape3: Shape {
    
    private var colour: Color
    private var number: Int
    private var fill: FillType
    private var shape: ShapeType
    
    init(theme: Theme3, number: Int, shape: ShapeType, fill: FillType, colour: ColorType) {
        self.colour = theme.colours[colour.rawValue]
        self.number = theme.numbers[number]
        self.fill = fill
        self.shape = shape
    }
    
    func path(in rect: CGRect) -> Path {
        var p : Path
        switch shape {
        case .oval: p = Capsule(style: .circular).path(in: rect)
        case .diamond: p = Diamond().path(in: rect)
        case .squiggle: p = RoundedRectangle(cornerRadius: 0).path(in: rect)
        }
        return p
    }
    
}

private struct Diamond : Shape {
    
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.midX, y: rect.minY)
        let right = CGPoint(x: rect.maxX, y: rect.midY)
        let bottom = CGPoint(x: rect.midX, y: rect.maxY)
        let left = CGPoint(x: rect.minX, y: rect.midY)
        var p = Path()
        p.move(to: start)
        p.addLine(to: right)
        p.addLine(to: bottom)
        p.addLine(to: left)
        return p
    }
   
}

