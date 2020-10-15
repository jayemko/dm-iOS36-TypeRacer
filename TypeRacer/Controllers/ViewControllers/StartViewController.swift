//
//  StartViewController.swift
//  TypeRacer
//
//  Created by Jason Koceja on 10/14/20.
//

import UIKit

class StartViewController : UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Helpers
    
    func createNewGame() -> TypeRacer {
        let newTypeRacer = TypeRacerController.createTypeRacer()
        return newTypeRacer
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ("toGame") {
            guard let destination = segue.destination as? ViewController else { return }
            let newGame = createNewGame()
            destination.game = newGame
        }
    }
}
