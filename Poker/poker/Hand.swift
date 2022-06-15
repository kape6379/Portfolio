//
//  Hand.swift
//  poker
//
//  Created by Aanvi Guliani on 11/15/21.
//

import Foundation

class Hand {
    var hand: [Card] = []
    var counts: [Int: Int] = [:]
    var numbers:[Double] = []
    var suits:[Int] = []
    var rank:Double
    var tempHand = [Card]()
    var tempCounts: [Int: Int] = [:]
    var tempNumbers:[Double] = []
    var tempSuits:[Int] = []
    
    init(){
        counts = [:]
        numbers = []
        suits = []
        rank = 0
        tempHand = [Card]()
    }
    
    init(h: [Card]){
        hand = h
        tempHand = h
        for item in h{
            numbers.append(Double(item.cardRank))
            counts[item.cardRank] = (counts[item.cardRank] ?? 0) + 1
            suits.append(item.suit)
        }
        rank = 0
    }
    
    func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
        if k == 0 {
            return [[]]
        }

        guard let first = elements.first else {
            return []
        }

        let head = [first]
        let subcombos = combos(elements: elements, k: k - 1)
        var ret = subcombos.map { head + $0 }
        ret += combos(elements: elements.dropFirst(), k: k)

        return ret
    }

    func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
        return combos(elements: ArraySlice(elements), k: k)
    }
    
    func update_rank_new_cards(){
        print("update rank new cards")
        var rank_temp = 0.0
        let combinations = combos(elements:hand,k:5)
        for c in combinations{
            //rank_temp = rank_hand()
            tempHand = c
            for item in c{
                tempNumbers.append(Double(item.cardRank))
                tempCounts[item.cardRank] = (tempCounts[item.cardRank] ?? 0) + 1
                tempSuits.append(item.suit)
            }
            rank_temp = rank_hand()
            if rank_temp >= rank{
                rank = rank_temp
            }
            // reset all temp values
            tempHand = [Card]()
            tempCounts = [:]
            tempNumbers = []
            tempSuits = []
        }
    }
    
    func rank_full()->Double{
        var three_ct: Int = 0
        var pair: Int = 0
        for(num,ct) in tempCounts{
            if(ct == 3){
                three_ct = num
            }
            if(ct == 2){
                pair = num
            }
        }
        return Double(90 + three_ct + pair/100)
    }
    
    
    func rank_four()->Double{
        var four:Int = 0
        var one: Int = 0
        for(num,ct) in tempCounts{
            if(ct == 4){
                four = num
            }
            else{
                one = num
            }
        }
        return Double(105 + four + one/100)
    }
    func rank_three()->Double{
        var three: Int = 0
        var max: Int = 0
        var min: Int = 100
        for(num,ct) in tempCounts{
            if(ct == 3){
                three = num
            }
            else{
                if(num > max){
                    max = num
                }
                if(num < min){
                    min = num
                }
            }
        }
        return Double(45 + three + max + min/100)
    }
    
    func update_rank(){
        //rank = rank_hand()
    }
    
    func rank_two()->Double{
        var pairs = [Double]()
        var non_pairs = [Double]()
        print(counts)
        for (num,ct) in tempCounts{
            if(ct == 2){
                pairs.append(Double(num))
            }
            else{
                non_pairs.append(Double(num))
            }
        }
        print(pairs)
        pairs.sort(by: >)
        non_pairs.sort(by: >)
        return Double(30 + pairs[0] + pairs[1]/100)
    }
    
    func rank_pair()->Double{
        var pair = 0
        for (num,ct) in tempCounts{
            if(ct == 2){
                pair = num
            }
        }
        return Double(15 + pair)
    }
    func rank_hand()->Double{
        var just_counts:[Int] = []
        var just_count_suits:[Int] = []
        for (_,ct) in tempCounts{
            just_counts.append(ct)
        }
        var counts_suit:[Int: Int] = [:]
        for item in tempSuits {
            counts_suit[item] = (counts_suit[item] ?? 0) + 1
        }
        for (_,ct) in counts_suit{
            just_count_suits.append(ct)
        }
        let sortednumbers = tempNumbers.sorted(by: >)
        let dif = sortednumbers[0] - sortednumbers[4] // assuming sorted, max value - min value
        let sortedcount = just_counts.sorted(by: >)
        var count_of_counts_dict: [Int: Int] = [:]
        var justcc: [Int] = []
        for item in just_counts {
            count_of_counts_dict[item] = (count_of_counts_dict[item] ?? 0) + 1
        }
        for (_,num) in count_of_counts_dict{
            justcc.append(num)
        }
        
    
        // all 5 cards have same suit -> flush
        if(just_count_suits.contains(5)){
            if(sortednumbers == [14,13,12,11,10]){
                print("royal flush")
                return 135
            }
            else if(dif==4 && sortedcount[0]==1){
                print("Straight flush")
                return Double(120 + sortednumbers[0])
            }
            else if(just_counts.contains(4)){
                print("four kind")
                return rank_four()
            }
            else if(just_counts.contains(3) && just_counts.contains(2)){
                print("full house")
                return rank_full()
            }
            else if(just_counts.contains(3)){
                print("three of a kind")
                return rank_three()
            }
            else if(justcc.contains(2)){
                print(justcc)
                print("two pair")
                return rank_two()//this is an error
            }
            else if(just_counts.contains(2)){
                print("pair")
                return rank_pair()
            }
            else{
                print("flush")
                return Double(75 + sortednumbers[0]/100)
            }
        }
        else if(just_counts.contains(4)){
            print("four kind")
            return rank_four()
        }
        else if(just_counts.contains(3) && just_counts.contains(2)){
            print("full house")
            return rank_full()
        }
        else if(just_counts.contains(3)){
            print("three of a kind")
            return rank_three()
        }
        else if(justcc.contains(4)){
            print("two pair")
            return rank_two()
        }
        else if(just_counts.contains(2)){
            print("pair")
            return rank_pair()
        }
        else if(dif == 4){
            print("straight")
            return Double(65 + sortednumbers[0]/100)
        }
        else{
            print("high card")
            return Double(sortednumbers[0])
        }
    }
    

}


