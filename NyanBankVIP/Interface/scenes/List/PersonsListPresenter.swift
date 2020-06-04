//
//  PersonsListPresenter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import Persons
import UIKit

protocol PersonsListPresentationLogic {
  func presentFileList(response: PersonsList.Files.Response)
  func presentIssues(response: PersonsList.Issues.Response)
  func presentIssuesError(response: PersonsList.Issues.Response)
}

typealias Issue = PersonsList.Issues.IssueInfo
typealias Option = PersonsList.Files.AlertOption

class PersonsListPresenter: PersonsListPresentationLogic {
  weak var viewController: PersonsListDisplayLogic?

  // MARK: Do something

  func presentFileList(response: PersonsList.Files.Response) {
    let viewModel = PersonsList.Files.ViewModel(
      alertTitle: NSLocalizedString("Persons", comment: ""),
      alertMessage: NSLocalizedString("Select CSV File", comment: ""),
      alertOptions: creataOptions(files: response.fileList)
    )

    viewController?.displayFileList(viewModel: viewModel)
  }

  func presentIssues(response: PersonsList.Issues.Response) {
    let issues = createIssues(persons: response.personsInfo)
    let viewModel = PersonsList.Issues.ViewModel(issues: issues)

    viewController?.displayPersonIssues(viewModel: viewModel)
  }

  func presentIssuesError(response: PersonsList.Issues.Response) {
    let errorDesc = response.error?.localizedDescription ?? "Unknown error"
    let viewModel = PersonsList.Issues.ViewModel(errorDescription: errorDesc)

    viewController?.displayPersonIssues(viewModel: viewModel)
  }
}

// MARK: Output --- Display something

private extension PersonsListPresenter {
  func creataOptions(files: [String]) -> [Option] {
    var options: [Option] = []

    options = files.map { fileName -> Option in
      Option(title: fileName, style: .default)
    }

    options.append(.init(title: NSLocalizedString("Other", comment: ""), style: .default))
    return options
  }

  func createIssues(persons: [Person]) -> [Issue] {
    var index: Int32 = -1
    return persons.map { person -> Issue in
      Issue(
        id: OSAtomicIncrement32(&index),
        name: "\(person.firstName) \(person.surname)",
        age: "\(person.dateOfBirth)",
        issueCount: "\(person.issueCount)"
      )
    }
  }
}
