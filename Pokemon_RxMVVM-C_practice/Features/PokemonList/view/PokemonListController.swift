//
//  HomeViewController.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 9/29/20.
//

import UIKit
import SwiftUI
import DropDown
import RxSwift

class PokemonListController: UIViewController {
  
  let tableView = UITableView()
  let dropDown = DropDown()
  let dropDownButton = UIButton()
  var safeArea: UILayoutGuide!
  let screenSize: CGRect = UIScreen.main.bounds
  
  var characters = ["Link", "Zelda", "Ganondorf", "Midna"]
  var choices = ["Sort results by...","Lowest Number (First)",
    "Highest Number (First)", "A-Z", "Z-A"]
  var pokemons : [Pokemon] = []
  
  var viewModel: PokemonListViewModel!
  private let disposeBag = DisposeBag()
  
  // MARK: - Lifecycle Methods
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureTable()
    configureDropDown()
    
    setTableConstraints()
    setDropDownConstraints()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationController?.navigationBar
      .prefersLargeTitles = true
    navigationItem.title = "Pokedex"
    navigationController?
      .setNavigationBarHidden(true, animated: false)
    
    
    safeArea = view.layoutMarginsGuide
    pokemons = fetchData()
  }
  
}

// MARK: - TableView
extension PokemonListController :
  UITableViewDataSource,
  UITableViewDelegate {
  
  func configureTable() {
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = screenSize.height * 0.4
    tableView.register(PokemonListCell.self,
      forCellReuseIdentifier: "pokemonCell")
    
    view.addSubview(tableView)
  }
  
  func setTableConstraints(){
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo:
      dropDownButton.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo:
      view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo:
      view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo:
      view.bottomAnchor).isActive = true
  }
  
  func tableView(_ tableView: UITableView,
    numberOfRowsInSection section: Int) -> Int {
      return pokemons.count
  }
  
  func tableView(_ tableView: UITableView,
    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
      let cell = tableView.dequeueReusableCell(withIdentifier:
        "pokemonCell", for: indexPath) as! PokemonListCell
      let pokemon = pokemons[indexPath.row]
      cell.set(pokemon: pokemon)
    
      return cell
  }
}

// MARK: - DropDown
extension PokemonListController {
  
  func configureDropDown() {
    dropDownButton.addTarget(self,
      action: #selector(self.tapChooseMenuItem(_:)),
        for: .touchUpInside)
    dropDownButton.backgroundColor = .gray
    dropDownButton.setTitle(choices[0], for: .normal)
    dropDownButton.contentHorizontalAlignment = .left
    dropDownButton.contentEdgeInsets
      = UIEdgeInsets(top: 5,left: 20,bottom: 5,right: 20)
    view.addSubview(dropDownButton)
  }
  
  func setDropDownConstraints() {
    dropDownButton.translatesAutoresizingMaskIntoConstraints = false
    dropDownButton.topAnchor.constraint(equalTo:
      safeArea.topAnchor).isActive = true
    dropDownButton.leadingAnchor.constraint(equalTo:
      view.leadingAnchor).isActive = true
    dropDownButton.trailingAnchor.constraint(equalTo:
      view.trailingAnchor).isActive = true
    dropDownButton.heightAnchor.constraint(equalToConstant:
      44).isActive = true
  }
  
  @objc func tapChooseMenuItem(_ sender: UIButton) {
    dropDown.dataSource = choices
    dropDown.anchorView = sender
    dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
    dropDown.show()
    dropDown.selectionAction = {[weak self] (index: Int, item: String) in
      guard let _ = self else { return }
      sender.setTitle(item, for: .normal)
    }
  }
}

// MARK: - DummyData
extension PokemonListController {
  func fetchData() -> [Pokemon] {
    let pokemon1 = Pokemon(id: "1", name: "Bulbasaur")
    let pokemon2 = Pokemon(id: "2", name: "Charmander")
    let pokemon3 = Pokemon(id: "3", name: "Bulbasaur2")
    let pokemon4 = Pokemon(id: "4", name: "Charmander2")
    let pokemon5 = Pokemon(id: "5", name: "Bulbasaur3")
    let pokemon6 = Pokemon(id: "6", name: "Charmander3")
    let pokemon7 = Pokemon(id: "7", name: "Bulbasaur4")
    let pokemon8 = Pokemon(id: "8", name: "Charmander4")
    let pokemon9 = Pokemon(id: "9", name: "Bulbasaur5")
    let pokemon10 = Pokemon(id: "10", name: "Charmander5")
    
    return [pokemon1,pokemon2,pokemon3,pokemon4,pokemon5,
            pokemon6,pokemon7,pokemon8,pokemon9,pokemon10]
  }
}
