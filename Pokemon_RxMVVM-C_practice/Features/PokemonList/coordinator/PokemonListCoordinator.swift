//
//  PokemonListCoordinator.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/8/20.
//

import RxSwift
import UIKit

class PokemonListCoordinator : BaseCoordinator<Void> {
  
  private let navigationController: UINavigationController
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  override func start() -> Observable<Void>{
    let viewController = PokemonListController()
    navigationController.setViewControllers([viewController],
      animated: true)
    return Observable.empty()
  }
  
}
