//
//  PokemonDetailsViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import UIKit
import Combine

class PokemonDetailsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var details: UILabel!
    
    var coordinator: PokemonDetailsCoordinator?
    var selectedPokemon: Pokemon!
    var pokemonDetailsViewModel: PokemonDetailsViewModel!
    var subscribers = [AnyCancellable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedPokemon.name
        subscribeToEvents()
        Task {
            await pokemonDetailsViewModel.fetchDetails(pokemonName: selectedPokemon.name)
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        coordinator?.goBackToList()
    }
    
    func subscribeToEvents() {
        pokemonDetailsViewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { isLoading in

            }
            .store(in: &subscribers)
        pokemonDetailsViewModel.pokemonDetails
            .receive(on: DispatchQueue.main)
            .sink { [weak self] pokemonDetails in
                self?.loadDetails(pokemonDetails: pokemonDetails)
            }
            .store(in: &subscribers)
    }
    
    func loadDetails(pokemonDetails: PokemonDetails) {
        details.text = String(pokemonDetails.weight)
    }
    
}
