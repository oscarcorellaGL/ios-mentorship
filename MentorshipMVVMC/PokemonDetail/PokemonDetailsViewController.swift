//
//  PokemonDetailsViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var details: UILabel!
    
    var coordinator: PokemonDetailsCoordinator?
    var selectedPokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPokemon.name
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        coordinator?.goBackToList()
    }
    
}
