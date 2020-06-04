//
//  PersonsListModels.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//
import UIKit
import Persons

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
      let issues: [IssueInfo]
      let errorDescription: String?

      init(issues: [IssueInfo] = [], errorDescription: String? = nil) {
        self.issues = issues
        self.errorDescription = errorDescription
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
