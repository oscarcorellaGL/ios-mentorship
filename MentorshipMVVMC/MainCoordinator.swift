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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
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
        let vc = PokemonDetailsViewController.instantiate()
        vc.coordinator = self
        vc.selectedPokemon = pokemon
        navigationController.pushViewController(vc, animated: true)
//        print(navigationController.viewControllers.count)
    }
}
