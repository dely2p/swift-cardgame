//
//  PokerGameTest.swift
//  CardGameTests
//
//  Created by TaeHyeonLee on 2017. 11. 28..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import XCTest

@testable import CardGame

class PokerGameTest: XCTestCase {
    var pokerGame: PokerGame!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testPokerGame() {
        pokerGame = PokerGame.init(cardDeck: CardDeck(), playerCount: 4, pokerRule: .fiveStud)
        XCTAssertEqual(pokerGame.players[0].name, "참가자#1")
        XCTAssertEqual(pokerGame.players[1].name, "참가자#2")
        XCTAssertEqual(pokerGame.players[2].name, "참가자#3")
        XCTAssertEqual(pokerGame.players[3].name, "참가자#4")
        XCTAssertEqual(pokerGame.dealer.name, "dealer")
        XCTAssertEqual(pokerGame.players[0].cards.count, 0)
        XCTAssertEqual(pokerGame.players[1].cards.count, 0)
        XCTAssertEqual(pokerGame.players[2].cards.count, 0)
        XCTAssertEqual(pokerGame.players[3].cards.count, 0)
        XCTAssertEqual(pokerGame.dealer.cards.count, 0)
    }

    func testNextTurn() {
        pokerGame = PokerGame.init(cardDeck: CardDeck(), playerCount: 3, pokerRule: .fiveStud)
        try! pokerGame.nextTurn()
        XCTAssertEqual(pokerGame.players[0].cards.count, 1)
        XCTAssertEqual(pokerGame.players[1].cards.count, 1)
        XCTAssertEqual(pokerGame.players[2].cards.count, 1)
        XCTAssertEqual(pokerGame.dealer.cards.count, 1)
        XCTAssertEqual(pokerGame.players[0].cards[0].description, "♣️K")
        XCTAssertEqual(pokerGame.players[1].cards[0].description, "♦️K")
        XCTAssertEqual(pokerGame.players[2].cards[0].description, "♥️K")
        XCTAssertEqual(pokerGame.dealer.cards[0].description, "♠️K")
    }

}