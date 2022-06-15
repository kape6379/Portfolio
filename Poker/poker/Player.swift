//
//  Player.swift
//  poker
//
//  Created by Ria Thakkar on 11/15/21.
//

import Foundation

protocol Player{
    var hand : Hand { get set }
    var money : Money { get set }
    var id: Int { get set }
    var subject: Table { get set }
    var playerType:String { get set }
    var inRound:Int { get set }
    var inGame:Int { get set }
    var playerBetTemp:Int{get set}
    func bet(current_bet:Int)->Int
    func update(update: String)
}
