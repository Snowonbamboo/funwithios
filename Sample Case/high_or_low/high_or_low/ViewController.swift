//
//  ViewController.swift
//  high_or_low
//
//  Created by student on 8/16/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var rand = Int(arc4random_uniform(10)) + 1
    var score = 0
    var attemptsRemaining = 3
    
    @IBOutlet var inputTextfield: UITextField!
    
    @IBOutlet var label: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var attemptLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func guess(sender : AnyObject)
    {
        
        let input = Int(inputTextfield.text!)
        //let rand = Int(arc4random_uniform(10)) + 1
        
        if (input == rand) {
            label.text = "You guessed it!"
            rand = Int(arc4random_uniform(10)) + 1
            score = score + 1
            scoreLabel.text = "Score: \(score)"
            attemptsRemaining = 3
            attemptLabel.text = "Attempts Remaining: \(attemptsRemaining)"
        } else if (input > rand) {
            attemptsRemaining = attemptsRemaining - 1
            if (attemptsRemaining > 0) {
                label.text = "Your guess is too high!"
            } else {
                label.text = "Sorry, You are out of guesses!"
                rand = Int(arc4random_uniform(10)) + 1
                attemptsRemaining = 3
            }
        } else {
            attemptsRemaining = attemptsRemaining - 1
            if (attemptsRemaining > 0) {
                label.text = "Your guess is too low!"
            } else {
                label.text = "Sorry, You are out of guesses!"
                rand = Int(arc4random_uniform(10)) + 1
                attemptsRemaining = 3
            }
        }
        attemptLabel.text = "Attempts Remaining: \(attemptsRemaining)"
        label.text = label.text! + "\nGuess: \(input!)"
        inputTextfield.text = ""
    }
}

