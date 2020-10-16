//
//  File.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/8/20.
//

import RxSwift
import UIKit

class AppCoordinator: BaseCoordinator<Void> {
    
  var window: UIWindow
    
  init(window: UIWindow) {
    self.window = window
  }
    
  override func start() -> Observable<Void> {
    let tabCoordinator = TabCoordinator(window: window)
    return coordinate(to: tabCoordinator)
  }
}
