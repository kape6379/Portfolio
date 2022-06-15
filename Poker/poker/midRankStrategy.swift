//
//  midRankStrategy.swift
//  poker
//
//  Created by Aanvi Guliani on 11/15/21.
//

import Foundation

// for rank 45-89
// 0.2 chance of fold or check (0 bet value)
// 0.70 chance of betting 60 - if there isn't enough money, try for 30, else 0
// 0.1 chance of of all in
//strategy
class midRankStrategy: betStrategy{
    func getBetValue(rank:Double,money:Int,current_bet:Int)->Int{
        let number = Double.random(in: 0...1)
        if(number <= 0.2){
            return 0
        }
        else if(number > 0.2 && number <= 0.9){
            if(current_bet <= 60 && money >= 60){
                return 20
            }
            else{
                if(current_bet <= 30 && money >= 30){
                    return 30
                }
                else{
                    return 0
                }
            }
        }
        else{
            return money
        }
    }
}
