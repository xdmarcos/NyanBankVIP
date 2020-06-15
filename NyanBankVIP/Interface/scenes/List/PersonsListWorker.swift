//
//  PersonsListWorker.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import Persons

struct PersonsListWorker {
  static let samples = ["Tiny", "Small", "Medium"]

  func retrieveFilesList() -> [String] {
    return PersonsListWorker.samples
  }

  func retriveIssues(filename: String) -> Result<[Person], Error> {
    return PersonsCSVLoader().loadResource(name: filename)
  }
}
