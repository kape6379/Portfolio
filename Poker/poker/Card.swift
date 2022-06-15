//
//  Card.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//

public struct Card{
    let suit: Int
    let cardRank: Int
    var cardAsset: String
    init(suit: Int, cardRank: Int){
        self.suit = suit
        self.cardRank = cardRank
        self.cardAsset = ""
        self.cardAsset = convertCardRank() + "_of_" + convertSuit()
    }
    
    func convertSuit() -> String{
        switch(suit){
            case 0 : return "spades"
            case 1: return "diamonds"
            case 2: return "clubs"
            case 3: return "hearts"
            default: return "error"
        }
    }
    
    func convertCardRank() -> String {
        switch(cardRank) {
            case 2 : return "2"
            case 3: return "3"
            case 4: return "4"
            case 5: return "5"
            case 6: return "6"
            case 7: return "7"
            case 8 : return "8"
            case 9: return "9"
            case 10: return "10"
            case 11: return "jack"
            case 12: return "queen"
            case 13: return "king"
            case 14: return "ace"
        default: do {
            return "none"
        }
        }
    }
}

