//
//  MainCoordinator.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 16/2/23.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators =  [Coordinator]()
    var navigationController: UINavigationController
    //crear request manager de la clase y arrancarlo en genial
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //Siempre instanciar el Request manager o es mejor crear uno compartido?
    
    func start() {
        let requestManager = RequestManager()
        let fetchPokemonService = FetchPokemonService(requestManager: requestManager)
        let listViewModel = PokemonListViewmodel(pokemonFetcher: fetchPokemonService)
        let vc = PokemonListViewController.instantiate()
        vc.coordinator = self
        vc.pokemonListViewModel = listViewModel
        navigationController.pushViewController(vc, animated: false)
    }
    
    func seeDetails(pokemon: Pokemon) {
        let coordinator = PokemonDetailsCoordinator(navigationController: navigationController, pokemon: pokemon)
        coordinator.start()
    }
}
