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
    
    var shape: ShapeType  { _shape }
    var number: Int { _number }
    var colour: ColorType { _colour }
    var shade: FillType  { _shade }
    var rgbColor: Color {
        theme.colours[_colour.rawValue]
    }
    
    // internal private vars
    private var _number: Int
    private var _shape: ShapeType
    private var _shade: FillType
    private var _colour: ColorType
    private var theme: Theme3
    
    init(theme: Theme3, number: Int, shape: ShapeType, shade: FillType, colour: ColorType) {
        _number = number
        _shape = shape
        _shade = shade
        _colour = colour
        self.theme = theme
    }
}

class Shape3SetGame: ObservableObject {
    
    @Published private var model = Shape3SetGame.createSetGame()
    
    private static func createSetGame() -> SetGame<Theme3, CardContent> {
        let theme = Theme3(numbers: [1,2,3], shapes: [], fills: [], colours: [.red, .gray, .purple])
        return SetGame<Theme3, CardContent>(theme: theme) { (theme, number, colour, shape, shading) -> CardContent in
            return CardContent(theme: theme, number: number, shape: shape, shade: shading, colour: colour)
        }
    }
    
    // MARK: - Access to the model
    var cards: [SetGame<Theme3, CardContent>.Card] { model.dealt }
    var score: Int { model.score }
    
    // MARK: - Intent(s)
    func touch(card: SetGame<Theme3, CardContent>.Card) {
        model.touch(card: card)
    }
    
    func deal(cards: Int) {
        model.deal(cards: cards)
    }
}

