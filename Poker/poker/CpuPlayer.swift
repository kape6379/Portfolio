//
//  CpuPlayer.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//

import Foundation

class CpuPlayer: Player{
    var subject: Table
    var hand: Hand
    var playerType = "CPU"
    var money: Money
    var id: Int
    var inRound: Int
    var inGame: Int
    var playerBetTemp: Int
    
    func bet(current_bet:Int)->Int{
        var bet_amount: Int
        if(hand.rank >= 0 && hand.rank <= 44){
            print("hand rank 0-44")
            let context = Context(strategy: lowRankStrategy())
            bet_amount = context.bet(rank:hand.rank,money:money.value,current_bet:current_bet)
        }
        else if(hand.rank >= 45 && hand.rank <= 89){
            print("hand rank 45-89")
            let context = Context(strategy: midRankStrategy())
            bet_amount = context.bet(rank:hand.rank,money:money.value,current_bet:current_bet)
        }
        else{
            print("hand rank else")
            let context = Context(strategy: highRankStrategy())
            bet_amount = context.bet(rank: hand.rank,money:money.value,current_bet:current_bet)
        }
        
        update(update: "Player: Bet \(bet_amount)")
        return bet_amount
    }
    

    init(id: Int, table: Table,strategy: betStrategy){

        self.id = id
        self.money = Money(value:0)
        self.hand = Hand()
        self.id = id
        self.subject = table
        self.inRound = 1
        self.inGame = 1
        self.playerBetTemp = 0
    }
    func update(update: String) {
            // business logic to decide whether to increase bid, and press the computer
        self.subject.notifyObservers(update: update)
    }
}
