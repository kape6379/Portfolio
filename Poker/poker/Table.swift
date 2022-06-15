//
//  Table.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//
import Foundation
import SwiftUI

public class Table{
    

   
    var deck = Deck()
    var dealtCards = [Card]()
    var burntCards = [Card]()
    var players = [Player]()
    var hands: [Hand] = []
    var dealer: Int
    var smallBlind: Int
    var bigBlind: Int
    var potAmount: Money
    var phase: gamePhase
    
    enum gamePhase {
        case deal
        case flop
        case turn
        case river
        case final
    }
    
    init(){
        dealer = 0
        smallBlind = 1
        bigBlind = 2
        potAmount = Money(value: 0)
        phase = gamePhase.deal
    }
    
    
    //mutating func playRound(){
    func playRound(){
        potAmount = Money(value: 0)
        smallBlind += 1
        bigBlind += 1
        
        for p in 0...players.count-1{
            players[p].inRound = players[p].inGame
        }
        
        switch phase{
            case .deal : deal()
            case .flop : flop()
            case .turn : turn()
            case .river : river()
            case .final : final()
        }
    }
    
    //mutating func deal(){
    func deal(){
    
        
        
        
        print("deal")
        // go around table twice and deal one card to all players
        // append that to the list
            for p in 0...players.count-1{
                if(players[p].inGame == 1){
                    hands.insert( Hand(h: [deck.draw(),deck.draw()] ), at: p )
                    
                }
            }
        
        
        
        for p in 0...players.count-1{
            if(players[p].inGame == 1){
               players[p].hand = hands[p]
            }
        }
        
        phase = .flop
        
    }
    
    //mutating func flop(){
    func flop(){
        
        print("flop")
        
        burntCards.append(deck.draw()) //discard
        let card1 = deck.draw()
        let card2 = deck.draw()
        let card3 = deck.draw()
        
        dealtCards.append(card1)
        dealtCards.append(card2)
        dealtCards.append(card3)
        
        var current_bet:Int = 0
        for p in 0...players.count-1{
            players[p].hand.hand.append(card1)
            players[p].hand.numbers.append(Double(card1.cardRank))
            players[p].hand.suits.append(card1.suit)
            players[p].hand.hand.append(card2)
            players[p].hand.numbers.append(Double(card2.cardRank))
            players[p].hand.suits.append(card2.suit)
            players[p].hand.hand.append(card3)
            players[p].hand.numbers.append(Double(card3.cardRank))
            players[p].hand.suits.append(card3.suit)
            //players[p].hand.update_rank_new_cards()
            
            if(players[p].inRound == 1){
                if(dealer != p){
                    if(smallBlind == p){
                        current_bet = 5
                        players[p].playerBetTemp = 5
                        players[p].money.value -= 5
                        potAmount.value += 5
                    }
                    else if(bigBlind == p){
                        current_bet = 10
                        players[p].money.value -= 10
                        potAmount.value += 10
                    }
                    else{
                        if(players[p].playerType == "User"){
                            // take in user input
                            // placeholder as 10 for now
                            current_bet = 10
                            players[p].playerBetTemp = 10
                            potAmount.value += current_bet
                            if(current_bet == 0){
                                players[p].inRound = 0
                            }
                        }
                        else{
                            current_bet = players[p].bet(current_bet: current_bet)
                            players[p].playerBetTemp = current_bet
                            potAmount.value += current_bet
                            if(current_bet == 0){
                                players[p].inRound = 0
                            }
                        }
                    }
                }
            }
        }
        
        // now that initial bets have been taken care of, we have to go around and match it
        // there is a 0.7 chance that if the player has the money, it will match the current bet
        for p in 0...players.count-1{
            if(players[p].inRound == 1){
                if(players[p].money.value >= current_bet){
                    let number = Double.random(in: 0...1)
                    if(number <= 0.7){
                        let added_value = current_bet - players[p].playerBetTemp
                        players[p].playerBetTemp += added_value
                        players[p].money.value -= added_value
                        potAmount.value += added_value
                    }
                    else{
                        players[p].inRound = 0
                    }
                }
            }
        }
        
        phase = .turn
    }
    
    ///mutating func turn(){
    func turn(){
        burntCards.append(deck.draw()) //discard
        let card1 = deck.draw()
        dealtCards.append(card1)
        var current_bet:Int = 0
        for p in 0...players.count-1{
            players[p].hand.hand.append(card1)
            players[p].hand.numbers.append(Double(card1.cardRank))
            players[p].hand.suits.append(card1.suit)
            //players[p].hand.update_rank_new_cards()
            
            if(players[p].inRound == 1){
                if(dealer != p){
                    if(players[p].playerType == "User"){
                            // take in user input
                            // placeholder as 10 for now
                            current_bet = 10
                            players[p].playerBetTemp = 10
                            potAmount.value += current_bet
                            if(current_bet == 0){
                                players[p].inRound = 0
                            }
                    }
                    else{
                        current_bet = players[p].bet(current_bet: current_bet)
                        players[p].playerBetTemp = current_bet
                        potAmount.value += current_bet
                        if(current_bet == 0){
                            players[p].inRound = 0
                        }
                    }
                }
            }
        }
        
        // now that initial bets have been taken care of, we have to go around and match it
        // there is a 0.5 chance that if the player has the money, it will match the current bet
        for p in 0...players.count-1{
            if(players[p].inRound == 1){
                if(players[p].money.value >= current_bet){
                    let number = Double.random(in: 0...1)
                    if(number <= 0.5){
                        let added_value = current_bet - players[p].playerBetTemp
                        players[p].playerBetTemp += added_value
                        players[p].money.value -= added_value
                        potAmount.value += added_value
                    }
                    else{
                        players[p].inRound = 0
                    }
                }
            }
        }
        phase = .river
    }
    
    //mutating func river(){
    func river(){
        burntCards.append(deck.draw()) //discard
        let card1 = deck.draw()
        dealtCards.append(card1)
        var current_bet:Int = 0
        for p in 0...players.count-1{
            players[p].hand.hand.append(card1)
            players[p].hand.numbers.append(Double(card1.cardRank))
            players[p].hand.suits.append(card1.suit)
            players[p].hand.update_rank_new_cards()
            
            if(players[p].inRound == 1){
                if(dealer != p){
                    if(players[p].playerType == "User"){
                            // take in user input
                            // placeholder as 10 for now
                            current_bet = 10
                            players[p].playerBetTemp = 10
                            potAmount.value += current_bet
                            if(current_bet == 0){
                                players[p].inRound = 0
                            }
                    }
                    else{
                        current_bet = players[p].bet(current_bet: current_bet)
                        players[p].playerBetTemp = current_bet
                        potAmount.value += current_bet
                        if(current_bet == 0){
                            players[p].inRound = 0
                        }
                    }
                }
            }
        }
        
        // now that initial bets have been taken care of, we have to go around and match it
        // there is a 0.3 chance that if the player has the money, it will match the current bet
        for p in 0...players.count-1{
            if(players[p].inRound == 1){
                if(players[p].money.value >= current_bet){
                    let number = Double.random(in: 0...1)
                    if(number <= 0.3){
                        let added_value = current_bet - players[p].playerBetTemp
                        players[p].playerBetTemp += added_value
                        players[p].money.value -= added_value
                        potAmount.value += added_value
                    }
                    else{
                        players[p].inRound = 0
                    }
                }
            }
        }
        phase = .final
    }
    
    //mutating func final(){
    func final(){
        var winner = 0
        var winnerRank = 0.0
        for p in 0...players.count-1{
            if(players[p].inRound == 1){
                let tempRank = players[p].hand.rank
                if(tempRank >= winnerRank){
                    winnerRank = tempRank
                    winner = p
                }
            }
        }
        // once winner decided, give pot amt to winner
        players[winner].money.value += potAmount.value
        
        // check to see who has run out of money and remove them from game
        for p in 0...players.count-1{
            if(players[p].money.value == 0){
                players[p].inGame = 0
            }
        }
    }
    
    //observer
    func notifyObservers(update: String){
        print(update)
    }
    
    //mutating func register(player: Player){
    func register(player: Player){
        players.append(player)
    }
    
    //mutating func deregister(player: Player) {
    func deregister(player: Player) {
        if let toRemove = players.enumerated().first(where: { $0.element.id == player.id })
        {
            players.remove(at: toRemove.offset)
        }
    }
}

