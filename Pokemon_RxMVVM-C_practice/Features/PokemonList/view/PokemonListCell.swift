//
//  PokemonListCell.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/12/20.
//

import UIKit

class PokemonListCell: UITableViewCell {
  
  var pokemonImage = UIImageView()
  var nameText = UILabel()
  var idText = UILabel()
  var typeText = UILabel()
  let screenSize: CGRect = UIScreen.main.bounds

  override init(style: UITableViewCell.CellStyle,
    reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier:
    reuseIdentifier)
    
    addSubview(pokemonImage)
    addSubview(nameText)
    addSubview(idText)
    //addSubview(typeText)
    
    configureImage()
    configureId()
    configureName()
    
    setImageConstraints()
    setIdConstraints()
    setNameConstraints()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(pokemon: Pokemon){
    idText.text = pokemon.id
    nameText.text = pokemon.name
  }
  
  func configureImage() {
    pokemonImage.layer.cornerRadius = 10
    pokemonImage.clipsToBounds = true
    pokemonImage.image = UIImage(named: "pokemonTemp")
  }
  
  func configureId() {
    idText.adjustsFontSizeToFitWidth = true
    idText.numberOfLines = 0
    idText.textColor = .gray
  }
  
  func configureName() {
    nameText.adjustsFontSizeToFitWidth = true
    nameText.numberOfLines = 1
    nameText.font = nameText.font.withSize(70)
    nameText.adjustsFontSizeToFitWidth = true
    nameText.minimumScaleFactor = 0.1
  }
  
  func configureType() {
    typeText.adjustsFontSizeToFitWidth = true
    typeText.numberOfLines = 0
  }
  
  func setImageConstraints(){
    pokemonImage.translatesAutoresizingMaskIntoConstraints
     = false
    pokemonImage.topAnchor.constraint(equalTo:
      topAnchor, constant: screenSize.height * 0.01)
      .isActive = true
    pokemonImage.centerXAnchor.constraint(equalTo:
      centerXAnchor).isActive = true
    pokemonImage.heightAnchor.constraint(equalToConstant:
      screenSize.height * 0.25).isActive = true
    pokemonImage.widthAnchor.constraint(equalToConstant:
      screenSize.width * 0.55).isActive = true
  }
  
  func setIdConstraints(){
    idText.translatesAutoresizingMaskIntoConstraints
      = false
    idText.topAnchor.constraint(equalTo:
      pokemonImage.bottomAnchor).isActive = true
    idText.leadingAnchor.constraint(equalTo:
      pokemonImage.leadingAnchor, constant: 10)
      .isActive = true
    idText.trailingAnchor.constraint(equalTo:
      pokemonImage.trailingAnchor, constant: -10).isActive = true
  }
  
  func setNameConstraints(){
    nameText.translatesAutoresizingMaskIntoConstraints
      = false
    nameText.topAnchor.constraint(equalTo:
      idText.bottomAnchor, constant: screenSize.height * 0.015)
      .isActive = true
    nameText.leadingAnchor.constraint(equalTo:
      idText.leadingAnchor).isActive = true
    nameText.trailingAnchor.constraint(equalTo:
      idText.trailingAnchor).isActive = true
    //nameText.bottomAnchor.constraint(equalTo:)
    
  }
  
  func setTypeConstraints(){
    
  }
  
  
  
  
}
