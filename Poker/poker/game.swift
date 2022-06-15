//
//  game.swift
//  poker
//
//  Created by Jess Ryan on 12/7/21.
//
import Foundation

//singelton
public class game{
    var gameTable: Table
    var roundCount: Int
    var playerFactory: playerFactory
    
    
    init(){
        self.gameTable = Table()
        self.playerFactory = poker.playerFactory(table: self.gameTable)
        playerFactory.createPlayerList()
        roundCount = 6
        playGame()
    }
    
    func playGame(){
        for _ in 1...roundCount{
            gameTable.playRound()
        }
          
    }
    func getWinner() -> Player{
        return gameTable.players.max(by: {(player1, player2)-> Bool in
            return player1.money.value < player1.money.value
        })!
    }
    
    func endGame(){
        var winner = getWinner()
    }
    
    
}
