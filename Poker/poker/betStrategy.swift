//
//  betStrategy.swift
//  poker
//
//  Created by Aanvi Guliani on 11/15/21.
//

import Foundation

//strategy
protocol betStrategy{
    func getBetValue(rank:Double,money:Int,current_bet:Int)->Int
}

