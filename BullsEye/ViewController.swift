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
        
        // Customized the slider
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(
            named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(
            top: 0,
            left: 14,
            bottom: 0,
            right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
            withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
            withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        // Method to set up everything for first game round
        startNewGame()
    }
    
    
    // Reads the value of the slider after the user presses the Hit Me! button + calculates game score
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue) // Absolute value always positive
        var points = 100 - difference
        
        // Lets the player know how well they did
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController (
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .default) {_ in    // Trailing closure
                self.startNewRound() // Starts the new round after OK button is tapped
            }
        
        // Makes the alert visible
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // Slider connection, rounds decimal to nearest int
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    // Starts a new game round
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        // Type conversion, compiler converts currentValue int to float for slider
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    // Action method to handle taps on the Start Over button which starts the game over
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        // Crossfade (subtle animation)
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    // Updates the contents of the labels
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
