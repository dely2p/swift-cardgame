//
//  CardDeck.swift
//  CardGame
//
//  Created by Eunjin Kim on 2017. 12. 21..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CardDeck {
    
    private var deck: [Card]
    
    init() {
        deck = [Card]()
        for shape in Card.Shape.kind {
            for number in Card.Number.kind {
                deck.append(Card(shape: shape, number: number))
            }
        }
        shuffle()
    }
    
    func count() -> Int {
        return deck.count
    }
    
    func shuffle() {
        //Fisher-Yates
        var cardOfChange = [Card]()
        for _ in 0..<deck.count {
            let numberOfRandom = Int(arc4random_uniform(UInt32(deck.count)))
            cardOfChange.append(deck.remove(at: numberOfRandom))
        }
        self.deck = cardOfChange
    }
    
    func removeOne() -> Card {
        return (deck.removeLast())
    }
    
    func reset() {
        deck.removeAll()
        let cardDeck = CardDeck()
        self.deck = cardDeck.deck
    }
    
    func makeCardStack() -> [[Card]] {
        var cardStack = [[Card]]()
        shuffle()
        for row in 0..<7 {
            cardStack.append([Card]())
            for _ in 0...row {
                let card = deck.popLast()
                cardStack[row].append(card!)
            }
        }
        return cardStack
    }
    
    func makeCardStack(gameInfo: GameInfo) throws -> [[Card]] {
        var cardStack = [[Card]]()
        guard deck.count > gameInfo.numberOfPlayer * gameInfo.kindOfGame else {
            throw GameInputView.CardGameError.Cardshortage
        }
        for row in 0..<gameInfo.numberOfPlayer {
            cardStack.append([Card]())
            for _ in 0..<gameInfo.kindOfGame {
                let card = deck.popLast()
                cardStack[row].append(card!)
            }
        }
        return cardStack
    }
    
}

