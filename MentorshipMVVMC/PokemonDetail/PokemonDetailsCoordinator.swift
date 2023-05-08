//
//  PokemonDetailsCoordinator.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 23/2/23.
//

import UIKit

class PokemonDetailsCoordinator {
    
    var navigationController: UINavigationController
    private let pokemon: Pokemon
    
    init(navigationController: UINavigationController, pokemon: Pokemon) {
        self.navigationController = navigationController
        self.pokemon = pokemon
    }
    
    func start() {
        let requestManager = RequestManager()
        let fetchPokemonDetailsService = FetchPokemonDetailsService(requestManager: requestManager)
        let detailsViewModel = PokemonDetailsViewModel(pokemonDetailsFetcher: fetchPokemonDetailsService)
        let vc = PokemonDetailsViewController.instantiate()
        vc.coordinator = self
        vc.selectedPokemon = pokemon
        vc.pokemonDetailsViewModel = detailsViewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBackToList() {
        navigationController.popViewController(animated: true)
    }
}
