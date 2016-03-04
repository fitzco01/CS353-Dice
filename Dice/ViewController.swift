//
//  ViewController.swift
//  Dice
//
//  Created by Connor Fitzpatrick on 2/16/16.
//  Copyright © 2016 Connor Fitzpatrick. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var buttonlist: [UIButton]!
    
    var die = MSDie(numSides: 6)

    @IBAction func roll(sender: UIButton) {
        
        for button in buttonlist {
            let temp = die.roll(button.tag)
            button.setTitle("\(temp)", forState: .Normal)
        }
        score.text! = "Score: \(die.total())"
    }
    
    @IBAction func dice(sender: UIButton) {
        //eventually change this to save the dice value temporarily (not roll it)
    
        sender.setTitle("\(die.roll(sender.tag))", forState: .Normal)
        
        score.text! = "Score: \(die.total())"
    }
    
    @IBAction func pause(sender: UILongPressGestureRecognizer) {
        
        if sender.state == UIGestureRecognizerState.Began {
            let button = sender.view as! UIButton
            
            let temp = die.pause(button.tag)
            if temp == 0 {
                button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            } else if temp == 1 {
                button.setTitleColor(UIColor(red: 0/255, green: 128/255, blue: 255/255, alpha: 1.0), forState: .Normal)
            }
        }
    }
}

//use tags? to connect dice to model and create different labels/images for each result (1-6)