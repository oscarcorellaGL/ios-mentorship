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
        
    }
    
    
    func subscribeToEvents() {
        pokemonListViewModel.isLoading
            .receive(on: DispatchQueue.main)
            .sink { isLoading in
                
            }
            .store(in: &subscribers)
        pokemonListViewModel.pokemons
            .receive(on: DispatchQueue.main)
            .sink { [weak self] pokemons in
                self?.loadData()
            }
            .store(in: &subscribers)
    }
    
    func loadData() {
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        //TASK hay una mejor forma, un scope dentro del VM?
//        Task {
//            await pokemonListViewModel.fetchPokemons()
//        }
        coordinator!.seeDetails()
    }

}

