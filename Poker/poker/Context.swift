//
//  Context.swift
//  poker
//
//  Created by Aanvi Guliani on 11/16/21.
//

import Foundation

class Context{
    private var strategy: betStrategy
    
    init(strategy: betStrategy){
        self.strategy = strategy
    }
    
    func update(strategy: betStrategy){
        self.strategy = strategy
    }
    
    func bet(rank:Double, money: Int, current_bet: Int)->Int{
        return strategy.getBetValue(rank:rank,money: money, current_bet: current_bet)
    }
}
