//
//  PokemonDetailsViewModel.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 24/2/23.
//

import Foundation
import Combine

protocol PokemonsDetailsFetcher {
    func fetchPokemonDetails(name: String) async -> PokemonDetails
}

final class PokemonDetailsViewModel {
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    var pokemonDetails = PassthroughSubject<PokemonDetails, Never>()
    private let pokemonDetailsFetcher: PokemonsDetailsFetcher

    init(isLoading: Bool = true, pokemonDetailsFetcher: PokemonsDetailsFetcher) {
        self.pokemonDetailsFetcher = pokemonDetailsFetcher
    }

    func fetchDetails(pokemonName: String) async {
        isLoading.send(true)
        let details = await pokemonDetailsFetcher.fetchPokemonDetails(name: pokemonName)
        self.pokemonDetails.send(details)
        isLoading.send(false)
    }
}
