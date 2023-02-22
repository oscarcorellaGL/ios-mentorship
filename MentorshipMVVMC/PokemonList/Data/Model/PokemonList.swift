//
//  PokemonList.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 16/2/23.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let results: [Pokemon]
}

struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
}
