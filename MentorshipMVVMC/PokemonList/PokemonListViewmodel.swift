//
//  PokemonListViewmodel.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 16/2/23.
//

import Foundation
import Combine

protocol PokemonsFetcher {
  func fetchPokemons() async -> PokemonList
}

final class PokemonListViewmodel {
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var pokemons = PassthroughSubject<PokemonList, Never>()
    private let pokemonFetcher: PokemonsFetcher

    init(isLoading: Bool = true, pokemonFetcher: PokemonsFetcher) {
        self.pokemonFetcher = pokemonFetcher
    }

    func fetchPokemons() async {
        isLoading.send(true)
        let pokemons = await pokemonFetcher.fetchPokemons()
        self.pokemons.send(pokemons)
        isLoading.send(false)
    }
}
