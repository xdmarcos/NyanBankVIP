//
//  PersonsDetailRouter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailRoutingLogic {

    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PersonsDetailDataPassing {

    var dataStore: PersonsDetailDataStore? { get }
}

class PersonsDetailRouter: PersonsDetailRoutingLogic, PersonsDetailDataPassing {

    weak var viewController: PersonsDetailViewController?
    var dataStore: PersonsDetailDataStore?

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
//    func navigate(from source: PersonsDetailViewController, to destination: SomewhereViewController) {
//
//        source.show(destination, sender: nil)
//    }
//
//    // MARK: Passing data
//
//    func passData(from source: PersonsDetailDataStore, to destination: inout SomewhereDataStore) {
//
//        destination.name = source.name
//    }
}
