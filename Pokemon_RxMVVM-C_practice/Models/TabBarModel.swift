//
//  TabBarModel.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/15/20.
//

import UIKit

enum TabChildren: Int {
  case list
  case search
  
  var title: String? {
    switch self {
    case .list:
      return "List"
    case .search:
      return "Search"
    }
  }
  
  var icon: UIImage? {
    switch self {
    case .list:
      return UIImage(named: "list")
    case .search:
      return UIImage(named: "search")
    }
  }
  
  var navigationController: UINavigationController {
    let navigation = UINavigationController()
    navigation.tabBarItem.title = self.title
    navigation.tabBarItem.image = self.icon
    return navigation
  }
}
