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

// MARK: - Result
struct Pokemon: Codable {
    let name: String
    let url: String
}
