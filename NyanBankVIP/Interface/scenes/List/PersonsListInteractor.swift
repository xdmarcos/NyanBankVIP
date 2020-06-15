//
//  PersonsListInteractor.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import Persons
import UIKit

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

  func doRetriveList(request _: PersonsList.Files.Request) {
    samples = worker.retrieveFilesList()

    let response = PersonsList.Files.Response(fileList: samples)
    presenter?.presentFileList(response: response)
  }

  func doRetriveIssues(request: PersonsList.Issues.Request) {
    DispatchQueue.global(qos: .background).async { [weak self] in
      guard let self = self else { return }

      let result = self.worker.retriveIssues(filename: request.fileName)

      DispatchQueue.main.async { [weak self] in
        guard let self = self else { return }

        switch result {
        case let .success(persons):
          self.issues = persons
          self.presenter?.presentIssues(response: PersonsList.Issues.Response(personsInfo: persons))
        case let .failure(error):
          self.issues = []
          self.presenter?.presentIssuesError(response: PersonsList.Issues.Response(error: error))
        }
      }
    }
  }
}

// MARK: Output --- Present something

extension PersonsListInteractor {}
