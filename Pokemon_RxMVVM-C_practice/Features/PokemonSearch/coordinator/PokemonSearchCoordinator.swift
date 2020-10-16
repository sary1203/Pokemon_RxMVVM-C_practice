//
//  PokemonSearchCoordinator.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/13/20.
//

import RxSwift
import ReactiveCoordinator

class PokemonSearchCoordinator : BaseCoordinator<Void> {
  
  private let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  override func start() -> Observable<Void>{
    let viewController = PokemonSearchController()
    navigationController.setViewControllers([viewController],
      animated: true)
    return Observable.empty()
  }
}
