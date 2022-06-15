
//
//  UserPlayer.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//

import Foundation

class UserPlayer: Player{
    var subject: Table
    var hand:Hand
    var money:Money
    var playerType = "User"
    var id: Int
    var inRound: Int
    var inGame: Int
    var playerBetTemp: Int


    func bet(current_bet:Int)->Int{
        let bet_amount = playerBetTemp // take in user input
        update(update: "Player: Bet \(bet_amount)")
        return bet_amount
    }
    

    init(table: Table,id: Int){
        self.id = id
        self.money = Money(value: 0)
        self.hand = Hand()
        self.subject = table
        self.id = id
        self.inRound = 1
        self.inGame = 1
        self.playerBetTemp = 0

    }
    func update(update: String) {
            // business logic to decide whether to increase bid, and press the computer
        self.subject.notifyObservers(update: update)
    }
}
