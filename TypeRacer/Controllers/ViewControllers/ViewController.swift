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
//        if game?.timeCompleted != nil {
        if timeEnded != nil {
            createNewGame()
        }
    }
    
    @IBAction func quitButtonTapped(_ sender: UIButton) {
        completeGame()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
        timeStarted = Date()
        timeEnded = nil
        resetButton.isHidden = true
        updateViewsForGame()
        print("[\(#fileID):\(#function):\(#line)] -- timeStarted: \(timeStarted)")
        print("[\(#fileID):\(#function):\(#line)] -- timeEnded: \(timeEnded)")
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        checkText()
        completeGame()
        print("[\(#fileID):\(#function):\(#line)] -- timeEnded: \(timeEnded)")
    }

    // MARK: - Helpers

    func setupViewsForGame() {
        typeEntryTextField.autocorrectionType = .no
        typeEntryTextField.spellCheckingType = .no
        typeEntryTextField.autocapitalizationType = .none
        typeEntryTextField.isUserInteractionEnabled = true
        
        
        if let game = game {
            paragraphLabel.text = game.paragraph
            clockLabel.text = ""
            typeEntryTextField.text = ""
            wordsPerMinuteLabel.text = "wpm"
            resetButton.isHidden = false
            resetButton.setTitle("Go!", for: .normal)
            typeEntryTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func updateViewsForGame() {
        guard let currentGame = game else { return }
        
        if let wordsPerMinute = currentGame.wpm {
            wordsPerMinuteLabel.text = "\(wordsPerMinute) wpm"
        }
        
        if let timeCompleted = currentGame.timeCompleted {
            resetButton.isHidden = false
            resetButton.setTitle("Play Again?", for: .normal)
        }
        if let timeEnded = timeEnded {
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
        checkText()
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
                completeGame()
        }
    }
    
    func completeGame() {
        timeEnded = Date()
        typeEntryTextField.resignFirstResponder()
        typeEntryTextField.isUserInteractionEnabled = false
        
        guard let currentGame = game,
              let currentGameTimeStarted = timeStarted,
              let currectGameTimeEnded = timeEnded else { return }
        
        TypeRacerController.completeTypeRacer(typeRacer: currentGame, timeStarted: currentGameTimeStarted, timeEnded: currectGameTimeEnded)
        print("[\(#fileID):\(#function): \(#line)] -- Completed!")
        updateViewsForGame()
    }
}
