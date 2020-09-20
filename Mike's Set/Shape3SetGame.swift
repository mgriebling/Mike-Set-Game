//
//  Shape3SetGame.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import SwiftUI

typealias Theme3 = Theme<ShapeType, FillType, Color>

enum ShapeType: Int, CaseIterable {
    case diamond
    case squiggle
    case oval
}

enum FillType: Int, CaseIterable {
    case solid
    case hatched
    case none
}

enum ColorType: Int, CaseIterable {
    case red
    case green
    case purple
}

struct CardContent: SetCardType {
    var shape: Int  { _shape.rawValue }
    var number: Int { _number }
    var colour: Int { _colour.rawValue }
    var shade: Int  { _shade.rawValue }
    
    // internal private vars
    private var _number: Int
    private var _shape: ShapeType
    private var _shade: FillType
    private var _colour: ColorType
    
    init(number: Int, shape: ShapeType, shade: FillType, colour: ColorType) {
        _number = number
        _shape = shape
        _shade = shade
        _colour = colour
    }
}

class Shape3SetGame: ObservableObject {
    
    @Published private var model = Shape3SetGame.createSetGame()
    
    private static func createSetGame() -> SetGame<Theme3, CardContent> {
        let theme = Theme3(numbers: [1,2,3], shapes: [], fills: [], colours: [.red, .green, .purple])
        return SetGame<Theme3, CardContent>(theme: theme) { (theme, number, colour, shape, shading) -> CardContent in
            return CardContent(number: number, shape: shape, shade: shading, colour: colour)
        }
    }
    
    // MARK: - Access to the model
    var cards: [SetGame<Theme3, CardContent>.Card] { model.dealt }
    var score: Int { model.score }
    
    // MARK: - Intent(s)
    func touch(card: SetGame<Theme3, CardContent>.Card) {
        model.touch(card: card)
    }
    
    func deal3() {
        model.deal3Cards()
    }
}
