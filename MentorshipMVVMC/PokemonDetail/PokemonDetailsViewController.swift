//
//  PokemonDetailsViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import UIKit

class PokemonDetailsViewController: UIViewController, Storyboarded {
    
    var coordinator: MainCoordinator?
    var selectedPokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPokemon.name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
