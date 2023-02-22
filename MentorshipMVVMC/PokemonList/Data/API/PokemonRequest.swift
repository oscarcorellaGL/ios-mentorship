//
//  PokemonRequest.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 17/2/23.
//

import Foundation

enum PokemonRequest: RequestProtocol {
  case getPokemonList
  case getPokemonBy

  var path: String {
    "pokemon/"
  }

  var requestType: RequestType {
    .GET
  }
}
