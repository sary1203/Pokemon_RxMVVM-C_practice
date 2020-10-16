//
//  TabCoordinator.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/15/20.
//

import UIKit
import RxSwift

class TabCoordinator: BaseCoordinator<Void> {
  
  private let window: UIWindow
  private let viewControllers: [UINavigationController]
  
  init(window: UIWindow) {
    self.window = window
    self.viewControllers = TabChildren.items
      .map({ (items) -> UINavigationController in
          let navigation = UINavigationController()
          navigation.tabBarItem.title = items.title
          navigation.tabBarItem.image = items.icon
          return navigation
      })
  }
  
  override func start() -> Observable<Void> {
    let viewController = TabController()
    viewController.tabBar.isTranslucent = false
    viewController.viewControllers = viewControllers
    
    let coordinates = viewControllers.enumerated()
      .map {
        (offset, element) -> Observable<Void> in
        guard let items = TabChildren(rawValue: offset) else {
          return Observable.just(())
        }
        switch items {
        case .list:
          return coordinate(to: PokemonListCoordinator(navigationController: element))
        case .search:
          return coordinate(to: PokemonSearchCoordinator(navigationController: element))
        }
      }
    
    Observable.merge(coordinates)
      .subscribe()
      .disposed(by: disposeBag)
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    
    return Observable.never()
  }
}
