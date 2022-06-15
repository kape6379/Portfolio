//
//  lowRankStrategy.swift
//  poker
//
//  Created by Aanvi Guliani on 11/15/21.
//

import Foundation

// for rank 0-44
// 0.75 chance of fold or check (0 bet value)
// 0.23 chance of bluffing - if current bet less than 20, bet 20
// 0.02 chance of of all in

//strategy

class lowRankStrategy: betStrategy{
    func getBetValue(rank:Double,money:Int,current_bet:Int)->Int{
        let number = Double.random(in: 0...1)
        if(number <= 0.75){
            return 0
        }
        else if(number > 0.75 && number <= 0.98){
            if(current_bet <= 20 && money >= 20){
                return 20
            }
            else{
                return 0
            }
        }
        else{
            return money
        }
    }
}
