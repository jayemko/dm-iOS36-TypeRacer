//
//  ViewController.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var typeEntryTextField: UITextField!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var wordsPerMinuteLabel: UILabel!
    @IBOutlet weak var paragraphLabel: UILabel!
    
    // MARK: - Properties
    
    var game: TypeRacer?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsForGame()
    }
    
    // MARK: - Helpers

    func setupViewsForGame() {
        if let game = game {
            paragraphLabel.text = game.paragraph
            clockLabel.text = "00:00"
            typeEntryTextField.text = ""
            resetButton.isHidden = false
            resetButton.setTitle("Go!", for: .normal)
        }
    }
}

