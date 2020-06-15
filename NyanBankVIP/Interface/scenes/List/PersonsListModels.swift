//
//  PersonsListModels.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import Persons
import UIKit

typealias AlertHandler = (UIAlertAction) -> Void
typealias Issue = PersonsList.Issues.IssueInfo
typealias Option = PersonsList.Files.AlertOption
typealias IssuesViewModel = PersonsList.Issues.ViewModel

enum PersonsList {
  // MARK: Use cases

  // Files
  enum Files {
    struct Request {}

    struct Response {
      let fileList: [String]
    }

    struct ViewModel {
      let alertTitle: String
      let alertMessage: String
      let alertOptions: [AlertOption]
    }

    struct AlertOption {
      let title: String
      let style: UIAlertAction.Style
    }
  }

  // Issues
  enum Issues {
    struct Request {
      let fileName: String
    }

    struct Response {
      let personsInfo: [Person]
      let error: Error?

      init(personsInfo: [Person] = [], error: Error? = nil) {
        self.personsInfo = personsInfo
        self.error = error
      }
    }

    struct ViewModel {
      static let navBarTitleDefault = NSLocalizedString(
        "Persons",
        comment: "Title for navigation bar"
      )
      let issues: [IssueInfo]
      let sections = 1
      let issuesLabelTitle: String
      let navBarTitle: String
      let errorDescription: String?

      init(
        issues: [IssueInfo] = [],
        issuesLabelTitle: String = "",
        navBarTitle: String = "",
        errorDescription: String? = nil
      ) {
        self.issues = issues
        self.errorDescription = errorDescription
        self.issuesLabelTitle = issuesLabelTitle
        self.navBarTitle = navBarTitle
      }
    }

    struct IssueInfo: Identifiable {
      let id: Int32
      let name: String
      let age: String
      let issueCount: String
    }
  }
}
