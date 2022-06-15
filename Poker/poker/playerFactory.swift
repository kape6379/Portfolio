//
//  playerFactory.swift
//  poker
//
//  Created by Jess Ryan on 12/6/21.
//

import Foundation

//factory
class playerFactory{
    var stratigies: [betStrategy]
    var table: Table
    
    
    init(table: Table){
        self.stratigies = [lowRankStrategy(),midRankStrategy(),highRankStrategy()]
        self.table = table
    }
    
    func createUserPlayer() -> UserPlayer{

        return UserPlayer(table: self.table, id: self.table.players.count)

    }
    
    func createCpuPlayer() -> CpuPlayer{
        return CpuPlayer(id: self.table.players.count, table: self.table, strategy: stratigies[Int.random(in: 0 ... 2)])
    }
    
    func createPlayerList(){
    
        for _ in 1 ... 4{
            self.table.register(player: createCpuPlayer())
        }
        self.table.register(player: createUserPlayer())
        
    }
    
    
}
