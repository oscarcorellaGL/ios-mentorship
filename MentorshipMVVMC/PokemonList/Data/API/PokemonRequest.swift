//
//  PokemonRequest.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import Foundation

enum PokemonRequest: RequestProtocol {
    case getPokemonList
    case getPokemonDetails(name: String)

    var path: String {
        switch self {
        case .getPokemonList:
            return "pokemon/"
        case .getPokemonDetails(let name):
            return "pokemon/"+name
        }
    }

    var requestType: RequestType {
    .GET
    }
}
