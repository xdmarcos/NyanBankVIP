//
//  PersonsDetailRouter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailRoutingLogic {
  func navigateBack()
}

protocol PersonsDetailDataPassing {
  var dataStore: PersonsDetailDataStore? { get }
}

class PersonsDetailRouter: PersonsDetailRoutingLogic, PersonsDetailDataPassing {
  weak var viewController: PersonsDetailViewController?
  var dataStore: PersonsDetailDataStore?

  func navigateBack() {
    viewController?.navigationController?.popViewController(animated: true)
  }
}
