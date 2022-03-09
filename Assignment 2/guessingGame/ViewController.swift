//
//  ViewController.swift
//  guessingGame
//
//  Created by Ekrem Yiğiter on 17.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    let guessingHelper = GuessingHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessingHelper.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playTheGame(_ sender: Any) {
        
        if (guessingHelper.pick == 0) {
            startTheGame()
            return
        }
        
        guard let input = textField.text else {
            return
        }
        
        if (input == "") {
            resultLabel.text = "Enter an integer!"
            return
        }
        
        guard let userInput = Int(input) else {
            resultLabel.text = "Enter an integer!"
            textField.text = ""
            return
        }
        
        if (userInput < 1 || userInput > 10) {
            resultLabel.text = "Make a guess between 1 - 10 !"
            textField.text = ""
            return
        }

        guessingHelper.increaseTries()
        if (guessingHelper.pick == userInput){
            winTheGame()
        } else if (guessingHelper.tries == 3) {
            loseTheGame()
        } else if (userInput < guessingHelper.pick) {
            arrowImage.isHidden = false
            arrowImage.image = UIImage(systemName: "arrow.up")
            textField.text = ""
        } else if (userInput > guessingHelper.pick) {
            arrowImage.isHidden = false
            arrowImage.image = UIImage(systemName: "arrow.down")
            textField.text = ""
        }
        
        
    }
    
    func wrongGuess() {
        resultLabel.text = "Try again!"
    }
    
    func startTheGame() {
        guessingHelper.getRandPick()
        guessingHelper.resetTries()
        button.setTitle("Guess", for: .normal)
        resultLabel.text = "Make a Guess"
        arrowImage.isHidden = true
        textField.isHidden = false
        textField.text = ""
    }
    
    func winTheGame() {
        button.setTitle("Restart", for: .normal)
        resultLabel.text = "You won!"
        arrowImage.isHidden = true
        textField.isHidden = true
        guessingHelper.pick = 0
    }
    
    func loseTheGame() {
        button.setTitle("Restart", for: .normal)
        resultLabel.text = "You loose!"
        arrowImage.isHidden = true
        textField.isHidden = true
        guessingHelper.pick = 0
    }

}

extension ViewController : GuessingGameProtocol {
    func triesRemains() {
        resultLabel.text = "\(3-guessingHelper.tries) tries remains!"
    }
}
