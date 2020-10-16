//
//  PokemonListViewModel.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/14/20.
//

import RxSwift
import Foundation

class PokemonListViewModel {
  /*
  // MARK: - Inputs
  let selectPokemon : AnyObserver<PokemonViewModel>
  let reload: AnyObserver<Void>
  let setCurrentFilter: AnyObserver<String>
  let chooseFilter: AnyObserver<Void>
  
  
  // MARK: - Outputs
  let pokemons: Observable<[PokemonViewModel]>
  let alertMessage: Observable<String>
  let showFilterList: Observable<Void>
  
  init(initialFilter: String, pokemonService:
    PokemonService = PokemonService()) {
    
    let _reload = PublishSubject<Void>()
    self.reload = _reload.asObserver()
    
    let _alertMessage = PublishSubject<String>()
    self.alertMessage = _alertMessage.asObservable()
    
    let _currentFilter = BehaviorSubject<String>(
      value: initialFilter)
    self.setCurrentFilter = _currentFilter.asObserver()
    
    self.pokemons = Observable.combineLatest(
      _reload, _currentFilter) { _, language in language }.flatMapLatest { language in
        pokemonService.getPokemons()
            .catchError { error in
                _alertMessage.onNext(error.localizedDescription)
                return Observable.empty()
            }
    }
    .map { pokemons in pokemons.map(PokemonViewModel.init) }
    
    let _selectPokemon = PublishSubject<PokemonViewModel>()
    self.selectPokemon = _selectPokemon.asObserver()
    
    let _chooseFilter = PublishSubject<Void>()
    self.showFilterList = _chooseFilter.asObserver()
    
  }*/
  
}
