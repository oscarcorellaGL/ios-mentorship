//
//  PokemonListViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 15/2/23.
//

import UIKit
import Combine

class PokemonListViewController: UIViewController, UITableViewDelegate, Storyboarded {
    
    @IBOutlet weak var tableView  : UITableView!
    
    var subscribers = [AnyCancellable]()
    var coordinator: MainCoordinator?
    var pokemonListViewModel: PokemonListViewmodel!
    var datasource: UITableViewDiffableDataSource<Int, Pokemon>!
    var pokemons = [Pokemon]()
    
    //Todo en este lifecycle, separarlo en más lifecycles?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.frame = view.bounds
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "pokemoncell", for: indexPath) as! PokemonTableViewCell
            cell.name.text = itemIdentifier.name
            return cell
        })
        
        subscribeToEvents()
        //TASK hay una mejor forma, un scope dentro del VM?
        Task {
            await pokemonListViewModel.fetchPokemons()
        }
        
        title = "Pokemons"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedPokemon = datasource.itemIdentifier(for: indexPath)
        coordinator!.seeDetails(pokemon: selectedPokemon!)
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
        var snapshot = NSDiffableDataSourceSnapshot<Int, Pokemon>()
        snapshot.appendSections([1])
        snapshot.appendItems(pokemons.results)
        datasource.apply(snapshot)
    }
    
}

