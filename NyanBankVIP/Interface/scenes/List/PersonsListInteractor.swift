//
//  PersonsListInteractor.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit
import Persons

protocol PersonsListBusinessLogic {
  func doRetriveList(request: PersonsList.Files.Request)
  func doRetriveIssues(request: PersonsList.Issues.Request)
}

protocol PersonsListDataStore {
  var samples: [String] { get set }
  var issues: [Person] { get set }
}

class PersonsListInteractor: PersonsListBusinessLogic, PersonsListDataStore {
  var presenter: PersonsListPresentationLogic?
  var worker = PersonsListWorker()
  var samples: [String] = []
  var issues: [Person] = []

  // MARK: Do something

  func doRetriveList(request: PersonsList.Files.Request) {
    samples = worker.retrieveFilesList()

    let response = PersonsList.Files.Response(fileList: samples)
    presenter?.presentFileList(response: response)
  }

  func doRetriveIssues(request: PersonsList.Issues.Request) {
    let result = worker.retriveIssues(filename: request.fileName)
    
    switch result {
    case let .success(persons):
      presenter?.presentIssues(response: PersonsList.Issues.Response(personsInfo: persons))
    case let .failure(error):
      presenter?.presentIssuesError(response: PersonsList.Issues.Response(error: error))
    }
  }
}

// MARK: Output --- Present something

extension PersonsListInteractor {}
