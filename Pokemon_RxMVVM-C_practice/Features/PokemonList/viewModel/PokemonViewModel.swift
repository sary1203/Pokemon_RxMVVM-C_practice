//
//  PokemonViewModel.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/14/20.
//

import Foundation

class PokemonViewModel {
  let name: String
  let id: String
  
  init(pokemon: Pokemon) {
    self.name = pokemon.name
    self.id = pokemon.id
  }
}
