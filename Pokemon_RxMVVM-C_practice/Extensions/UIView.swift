//
//  UIView.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/12/20.
//

import UIKit

extension UIView {

  func pin(to superView: UIView){
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo:
      superView.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo:
      superView.bottomAnchor).isActive = true
    leadingAnchor.constraint(equalTo:
      superView.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo:
      superView.trailingAnchor).isActive = true
  }

}
