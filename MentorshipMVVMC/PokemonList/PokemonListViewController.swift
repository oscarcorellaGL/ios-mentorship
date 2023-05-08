//
//  PokemonListViewController.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 15/2/23.
//

import UIKit
import Combine

//typealias snapshot

class PokemonListViewController: UIViewController, Storyboarded {
    
    @IBOutlet var tableView  : UITableView!
    typealias PokemonDatasource = UITableViewDiffableDataSource<Int, Pokemon>
    
    var subscribers = [AnyCancellable]()
    var coordinator: MainCoordinator?
    var pokemonListViewModel: PokemonListViewmodel!
    var datasource: PokemonDatasource!
    var pokemons = [Pokemon]()
    
    //Todo en este lifecycle, separarlo en más lifecycles?
    //Esto solo se llama cuando el VC entra en el stack de navegación
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.frame = view.bounds
        datasource = prepareDatasource()
        subscribeToEvents()
        //TASK hay una mejor forma, un scope dentro del VM?
        Task {
            await pokemonListViewModel.fetchPokemons()
        }
        
        title = "Pokemons"
    }
    
    //ViewWillAppear siempre se llama cuando el VC toma control
    
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
        //Mover snapshot al VM para no exponer el modelo en el VC
        var snapshot = NSDiffableDataSourceSnapshot<Int, Pokemon>()
        snapshot.appendSections([1])
        snapshot.appendItems(pokemons.results)
        datasource.apply(snapshot)
    }
    
}

extension PokemonListViewController {
    func prepareDatasource() -> PokemonDatasource {
        UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "pokemoncell", for: indexPath) as! PokemonTableViewCell
            cell.name.text = itemIdentifier.name
            return cell
        })
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedPokemon = datasource.itemIdentifier(for: indexPath)
        coordinator!.seeDetails(pokemon: selectedPokemon!)
    }
}

