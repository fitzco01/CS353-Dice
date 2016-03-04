//
//  Die.swift
//  Dice
//
//  Created by Connor Fitzpatrick on 2/18/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.
//

import Foundation


class MSDie {
    var currentValue = 0
    var numSides = 0
    var buttondict: [Int: [Int]]
    
    init(numSides: Int) {
        self.numSides = numSides
        currentValue = Int(arc4random_uniform(6)) + 1
        buttondict = [1:[1,0]]
        var i = 0
        while i < 6 {
        buttondict[i] = [1,0]
        i += 1
        }
    }
    //func roll(key)
    func roll(key: Int) -> Int{
        if buttondict[key]![0] == 0 {
            currentValue =  buttondict[key]![1]
            
        } else if buttondict[key]![0] == 1 {
        currentValue = Int(arc4random_uniform(6)) + 1
        buttondict[key]![1] = currentValue
        }
        return currentValue
    }
    
    func total() -> Int {
        var totalValues = 0
        var key = 0
        while key < 6 {
            totalValues = totalValues + buttondict[key]![1]
            key += 1
        }
        return totalValues
    }
    
    func pause(key: Int) -> Int {
        if buttondict[key]![0] == 0 {
            //0 = paused
            buttondict[key]![0] = 1
            return 1
        } else {
            //1 = not paused
            buttondict[key]![0] = 0
            return 0
        }
    }
}