//
//  SetGame.swift
//  Mike's Set
//
//  Created by Mike Griebling on 2020-09-19.
//

import Foundation

protocol SetCardType {
    
    var shape: ShapeType { get }
    var number: Int { get }
    var colour: ColorType { get }
    var shade: FillType { get }
    
}

struct SetGame<ThemeType, CardContent:SetCardType> {
    
    // Initially contains all the game's cards
    private var cards: [Card]
    
    // As cards are dealt they are placed here
    private(set) var dealt: [Card]
    
    // The game's score
    private(set) var score = 0
    
    // Generic set matching function
    func matchSet<Type:Equatable>(_ a: Type, _ b:Type, _ c:Type) -> Bool {
        let matchNone = a != b && b != c && a != c
        let matchAll = a == b && b == c // a must be equal to c as well
        return matchAll || matchNone
    }
    
    private func areMatched(card1: Card, card2: Card, card3: Card) -> Bool {
        // Basically the matching rules of Set are encoded here
        let c = card3.content
        let b = card2.content
        let a = card1.content
        let shapeMatch  = matchSet(a.shape, b.shape, c.shape)
        let numberMatch = matchSet(a.number, b.number, c.number)
        let colourMatch = matchSet(a.colour, b.colour, c.colour)
        let shadeMatch  = matchSet(a.shade, b.shade, c.shade)
        return shapeMatch && numberMatch && colourMatch && shadeMatch
    }
    
    mutating func touch(card: Card) {
        if let index = dealt.firstIndex(matching: card), !dealt[index].isTouched, !dealt[index].isMatched {
            dealt[index].isTouched = !dealt[index].isTouched
        }
    }
    
    mutating func deal(cards: Int) {
        for _ in 1...cards {
            dealt.append(self.cards.removeFirst())
        }
    }
    
    init(theme: ThemeType, cardContentFactory: (ThemeType, Int, ColorType, ShapeType, FillType) -> CardContent) {
        cards = []
        dealt = []
        var id = 0
        for number in 1...ShapeType.allCases.count {
            for shape in ShapeType.allCases {
                for colour in ColorType.allCases {
                    for shade in FillType.allCases {
                        let content = cardContentFactory(theme, number, colour, shape, shade)
                        cards.append(Card(id: id, content: content))
                        id += 1
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isMatched = false
        var isTouched = false
        var content: CardContent
    }
    
}


