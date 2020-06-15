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
    let issuesLabel = NSLocalizedString("Issues", comment: "Issues label title for TV cell")
    let navBarTitle = IssuesViewModel.navBarTitleDefault + " (\(issues.count))"
    let viewModel = PersonsList.Issues.ViewModel(
      issues: issues,
      issuesLabelTitle: issuesLabel,
      navBarTitle: navBarTitle
    )

    viewController?.displayPersonIssues(viewModel: viewModel)
  }

  func presentIssuesError(response: PersonsList.Issues.Response) {
    var errorDesc = response.error?.localizedDescription ??
      NSLocalizedString("Unknown error", comment: "")
    if let error = response.error as? PersonsCSVLoaderError {
      switch error {
      case .failedToOpenStream:
        errorDesc = NSLocalizedString("The file seems corrupted!", comment: "")
      case .invalidPath:
        errorDesc = NSLocalizedString("This feature is not implemented yet!", comment: "")
      }
    }

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
        age: "\(makeAge(person: person, referenceDate: Date(), callendar: Calendar.current))",
        issueCount: "\(person.issueCount)"
      )
    }
  }

  func makeAge(
    person: Person,
    referenceDate reference: Date,
    callendar: Calendar
  ) -> String {
    let components = callendar
      .dateComponents([.year, .month, .day], from: person.dateOfBirth, to: reference)
    return [
      (NSLocalizedString("%dy", comment: "Age in years"), components.year),
      (NSLocalizedString("%dm", comment: "Age in months"), components.month),
      (NSLocalizedString("%dd", comment: "Age in days"), components.day),
    ]
    .compactMap { $0.1 != nil && $0.1! > 0 ? String(format: $0.0, $0.1!) : nil }
    .joined(separator: " ")
  }
}
