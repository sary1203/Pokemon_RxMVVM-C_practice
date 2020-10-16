//
//  PokemonsService.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/14/20.
//

import Foundation
import RxSwift
import RxCocoa

enum ServiceError: Error {
  case cannotParse
}

class PokemonService {
    
  private let session: URLSession
  
  init(session: URLSession = URLSession.shared) {
    self.session = session
  }
  
  /*func getFilterList() -> Observable<[String]>{
    return Observable.just([
      "Sort results by...",
      "Lowest Number (First)",
      "Highest Number (First)",
      "A-Z",
      "Z-A"
    ])
  }*/
  
  func getPokemons() -> Observable<[Pokemon]>{
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    return session.rx
      .json(url: url)
      .flatMap { json throws -> Observable<[Pokemon]> in
          guard
              let json = json as? [String: Any],
              let itemsJSON = json["name"] as? [[String: Any]]
          else { return Observable.error(ServiceError.cannotParse) }

          let pokemons = itemsJSON.flatMap(Pokemon.init)
          return Observable.just(pokemons)
      }
  }
}
