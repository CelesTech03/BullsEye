//
//  ViewController.swift
//  BullsEye
//
//  Created by Celeste Urena on 9/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    // Special outlet (stores a reference to the slider as a new instance var)
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Method to set up everything for first game round
        startNewRound()
    }
    
    
    // Reads the value of the slider after the user presses the Hit Me! button + calculates game score
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue) // Absolute value always positive
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController (
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    // Slider connection, rounds decimal to nearest int
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    // Starts a new game round
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = lroundf(slider.value)
        // Type conversion, compiler converts currentValue int to float for slider
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    // Updates the contents of the labels
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

