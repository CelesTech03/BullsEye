//
//  ViewController.swift
//  BullsEye
//
//  Created by Celeste Urena on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue = 0
    // Special outlet (stores a reference to the slider as a new instance var)
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Method to set up everything for first game round
        startNewRound()
    }

    
    // Reads the value of the slider after the user presses the Hit Me! button
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        
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
        targetValue = Int.random(in: 1...100)
        currentValue = lroundf(slider.value)
        // Type conversion, compiler converts currentValue int to float for slider
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    // Updates the contents of the labels
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

