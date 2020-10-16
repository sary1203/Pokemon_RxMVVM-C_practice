//
//  TabViewModel.swift
//  Pokemon_RxMVVM-C_practice
//
//  Created by Randy Flores on 10/15/20.
//

import RxSwift

class TabViewModel {
  
  // MARK: - Inputs
  let tapBar: AnyObserver<Void>
  
  // MARK: - Outputs
  let showListTab: Observable<Void>
  let showSearchTab: Observable<Void>
  
  
  init(initialSelectedTab: Int){
    let _tapBar = PublishSubject<Void>()
    self.tapBar = _tapBar.asObserver()
    self.showListTab = _tapBar.asObservable()
    self.showSearchTab = _tapBar.asObservable()
    
  }
}
