//
//  PersonsListInteractor.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsListBusinessLogic {
  func doSomething(request: PersonsList.Something.Request)
}

protocol PersonsListDataStore {
  // var name: String { get set }
}

class PersonsListInteractor: PersonsListBusinessLogic, PersonsListDataStore {
  var presenter: PersonsListPresentationLogic?
  var worker: PersonsListWorker?
  // var name: String = ""

  // MARK: Do something

  func doSomething(request _: PersonsList.Something.Request) {
    worker = PersonsListWorker()
    worker?.doSomeWork()

    let response = PersonsList.Something.Response()
    presenter?.presentSomething(response: response)
  }
}

// MARK: Output --- Present something

extension PersonsListInteractor {}
