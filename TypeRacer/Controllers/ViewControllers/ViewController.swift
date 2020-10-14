//
//  ViewController.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import UIKit

/*
 reset button
 quit button
 words to type label
 clocklabel
 type entry text field
 wordsperminutelabel
 */

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var typeEntryTextField: UITextField!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var wordsPerMinuteLabel: UILabel!
    @IBOutlet weak var paragraphLabel: UILabel!
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Helpers

}

