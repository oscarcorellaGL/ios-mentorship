//
//  PokemonListViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 15/2/23.
//

import UIKit
import Combine

class PokemonListViewController: UIViewController, Storyboarded {
    
    var subscribers = [AnyCancellable]()
        
    var coordinator: MainCoordinator?
    var pokemonListViewModel: PokemonListViewmodel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeToEvents()
        //TASK hay una mejor forma, un scope dentro del VM?
        Task {
            await pokemonListViewModel.fetchPokemons()
        }
    }
    
    func subscribeToEvents() {
        pokemonListViewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { isLoading in
                self.updateLoadingState(isLoading: isLoading)
            }
            .store(in: &subscribers)
        pokemonListViewModel.pokemons
            .receive(on: DispatchQueue.main)
            .sink { [weak self] pokemons in
                self?.loadData(pokemons: pokemons)
            }
            .store(in: &subscribers)
    }
    
    private func updateLoadingState(isLoading: Bool) {
        
    }
    
    private func loadData(pokemons: PokemonList) {
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        coordinator!.seeDetails()
    }

}

