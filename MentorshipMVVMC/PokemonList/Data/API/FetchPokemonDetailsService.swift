//
//  FetchPokemonDetailsService.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 24/2/23.
//

import Foundation

struct FetchPokemonDetailsService {
  private let requestManager: RequestManagerProtocol

  init(requestManager: RequestManagerProtocol) {
    self.requestManager = requestManager
  }
}

extension FetchPokemonDetailsService: PokemonsDetailsFetcher {
    func fetchPokemonDetails(name: String) async -> PokemonDetails {
        let requestData = PokemonRequest.getPokemonDetails(name: name)
        do {
            let details: PokemonDetails = try await requestManager.perform(requestData)
            return details
        } catch {
            print(error.localizedDescription)
            return PokemonDetails(weight: 0)
        }
    }
}
