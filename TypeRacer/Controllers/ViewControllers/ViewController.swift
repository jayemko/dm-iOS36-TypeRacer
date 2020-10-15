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
    var timeStarted: Date?
    var timeEnded: Date?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsForGame()
    }
    // MARK: - Actions
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // Go!
        if timeStarted == nil {
            timeStarted = Date()
            resetButton.isHidden = true
        }
        // Play Again?
        if game?.timeCompleted != nil {
            createNewGame()
        }
    }
    
    @IBAction func quitButtonTapped(_ sender: UIButton) {
        completeGame()
    }
    
    @IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
        timeStarted = Date()
        updateViewsForGame()
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        checkText()
        completeGame()
    }

    // MARK: - Helpers

    func setupViewsForGame() {
        if let game = game {
            paragraphLabel.text = game.paragraph
            clockLabel.text = "00:00"
            typeEntryTextField.text = ""
            wordsPerMinuteLabel.text = "wpm"
            resetButton.isHidden = false
            resetButton.setTitle("Go!", for: .normal)
            typeEntryTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func updateViewsForGame() {
        guard let currentGame = game else { return }
        if let enteredText = typeEntryTextField.text {
            checkText()
        }
        
        if let wordsPerMinute = currentGame.wpm {
            wordsPerMinuteLabel.text = "\(wordsPerMinute) wpm"
        }
        
        if let timeCompleted = currentGame.timeCompleted {
            clockLabel.text = "\(timeCompleted)" // TODO FORMAT
            resetButton.isHidden = false
            resetButton.setTitle("Play Again?", for: .normal)
        }
        if timeStarted != nil && timeEnded == nil {
            resetButton.isHidden = true
        }
        
    }
    
    func createNewGame() {
        let newTypeRacer = TypeRacerController.createTypeRacer()
        game = newTypeRacer
        setupViewsForGame()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("[\(#fileID):\(#function):\(#line)] -- \(textField.text)")
//        checkText()
    }
    
    func checkText() {
        guard let enteredText = typeEntryTextField.text,
              let currentGame = game else { return }
        let status = TypeRacerController.checkText(text: enteredText, typeRacer: currentGame)
        switch status {
            case .typo:
                typeEntryTextField.textColor = .red
            case .noErrors:
                typeEntryTextField.textColor = .darkGray
            case .complete:
                typeEntryTextField.textColor = .green
        }
    }
    
    func completeGame() {
        timeEnded = Date()
        TypeRacerController.completeTypeRacer(typeRacer: game, timeStarted: timeStarted, timeEnded: timeEnded)
        updateViewsForGame()
    }
}
