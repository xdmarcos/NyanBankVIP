//
//  PersonsListRouter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

protocol PersonsListRoutingLogic {
  func navigateToDetailView(index: Int)
}

protocol PersonsListDataPassing {
  var dataStore: PersonsListDataStore? { get }
}

class PersonsListRouter: PersonsListRoutingLogic, PersonsListDataPassing {
  weak var viewController: PersonsListViewController?
  var dataStore: PersonsListDataStore?

  func navigateToDetailView(index: Int) {
    guard let sourceVC = viewController else { return }

    let destinationVC = PersonsDetailViewController()
    if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
      passData(from: sourceDS, to: &destinationDS, selectedIndex: index)
    }

    navigate(from: sourceVC, to: destinationVC)
  }
}

private extension PersonsListRouter {
  // MARK: Passing data

  func passData(
    from source: PersonsListDataStore,
    to destination: inout PersonsDetailDataStore,
    selectedIndex: Int?
  ) {
    guard let index = selectedIndex, source.issues.count > index else { return }

    destination.incommingPerson = source.issues[index]
  }

  // MARK: Navigation

  func navigate(
    from source: PersonsListViewController,
    to destination: PersonsDetailViewController
  ) {
    source.navigationController?.pushViewController(destination, animated: true)
  }
}
