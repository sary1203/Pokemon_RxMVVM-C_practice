//
//  Pokemon.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/12/20.
//

import UIKit


struct Pokemon {
  //var image : UIImage
  var id : String
  var name: String
}

extension Pokemon {
  init?(from json: [String: Any]) {
    guard let results = json["results"] as? [String]
    
    else {return nil}
    
    self.init(id: "init", name: "init")
  }
}
