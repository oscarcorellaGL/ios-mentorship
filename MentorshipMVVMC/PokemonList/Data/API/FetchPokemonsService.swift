//
//  FetchPokemonsService.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import Foundation

struct FetchPokemonService {
  private let requestManager: RequestManagerProtocol

  init(requestManager: RequestManagerProtocol) {
    self.requestManager = requestManager
  }
}

// MARK: - AnimalFetcher
extension FetchPokemonService: PokemonsFetcher {
  func fetchPokemons() async -> PokemonList {
    let requestData = PokemonRequest.getPokemonList
    do {
        let pokemonList: PokemonList = try await requestManager.perform(requestData)
        return pokemonList
    } catch {
        print(error.localizedDescription)
        return PokemonList(count: 0, results: [])
    }
  }
}
