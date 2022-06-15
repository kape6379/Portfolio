//
//  highRankStrategy.swift
//  poker
//
//  Created by Aanvi Guliani on 11/15/21.
//

import Foundation

// for rank 90+
// 0.1 chance of fold or check (0 bet value)
// 0.7 chance of betting 100 - if there isn't enough money, try for 50, then 30, then 0
// 0.2 chance of of all in
// if there's royal flush, all in
//strategy
class highRankStrategy: betStrategy{
    func getBetValue(rank:Double,money:Int,current_bet:Int)->Int{
        let number = Double.random(in: 0...1)
        if(rank == 135){
            return money
        }
        if(number <= 0.1){
            return 0
        }
        else if(number > 0.1 && number <= 0.8){
            if(current_bet <= 60 && money >= 60){
                return 20
            }
            else{
                if(current_bet <= 50 && money >= 50){
                    return 30
                }
                else if(current_bet <= 30 && money >= 30){
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
