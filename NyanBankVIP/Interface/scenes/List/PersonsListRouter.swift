//
//  PersonsListRouter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

protocol PersonsListRoutingLogic {
  // func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PersonsListDataPassing {
  var dataStore: PersonsListDataStore? { get }
}

class PersonsListRouter: PersonsListRoutingLogic, PersonsListDataPassing {
  weak var viewController: PersonsListViewController?
  var dataStore: PersonsListDataStore?

  // MARK: Routing

//    func routeToSomewhere(segue: UIStoryboardSegue?) {
//
//        let destinationVC = SomewhereViewController()
//        if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
//
//            passData(from: sourceDS, to: &destinationDS)
//        }
//
//        if let sourceVC = viewController {
//            navigate(from: sourceVC, to: destinationVC)
//        }
//    }
//
//    // MARK: Navigation
//
//    func navigate(from source: PersonsListViewController, to destination: SomewhereViewController) {
//
//        source.show(destination, sender: nil)
//    }
//
//    // MARK: Passing data
//
//    func passData(from source: PersonsListDataStore, to destination: inout SomewhereDataStore) {
//
//        destination.name = source.name
//    }
}
