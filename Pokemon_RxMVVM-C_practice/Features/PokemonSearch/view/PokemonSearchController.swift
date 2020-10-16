//
//  PokemonSearchController.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/13/20.
//

import UIKit

class PokemonSearchController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .white
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationItem.title = "Search"
    }

}
