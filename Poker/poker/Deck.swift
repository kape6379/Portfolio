//
//  Deck.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//
import Foundation

public struct Deck{
    private var cardsInStack = [Card]()
    
    mutating func createDeck(){
        var cards = [Card]()
        for _ in 0...1{
            for value in 2 ... 14 {
                for suit in 0 ... 3{
                    cards.append(Card(suit: suit, cardRank: value))
                }
            }
        }
        self.cardsInStack = cards
    }
    
    mutating func shuffle() {
            
            // Loop, shuffle to random pos from index on
            for (index, _) in cardsInStack.enumerated() {
                let pos = Int(arc4random_uniform(UInt32(cardsInStack.count - index))) + index
                
                // swap cards
                let temp = cardsInStack[index]
                cardsInStack[index] = cardsInStack[pos]
                cardsInStack[pos] = temp
            }
            
            //print(description) // Show me the deck of cards
        }
        
    mutating func draw() -> Card {
            let card = cardsInStack.popLast()
            return card!
        }
    init() {
        createDeck()
        shuffle()
    }
}




