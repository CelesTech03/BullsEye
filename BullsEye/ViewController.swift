//
//  ViewController.swift
//  BullsEye
//
//  Created by Celeste Urena on 9/29/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // Sends the user an alert when the button has been clicked
    @IBAction func showAlert() {
        let alert = UIAlertController (
            title: "Hello World",
            message: "This is my first app!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Awesome",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

