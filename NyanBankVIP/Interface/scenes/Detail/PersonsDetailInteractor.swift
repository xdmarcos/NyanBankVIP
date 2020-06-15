//
//  PersonsDetailInteractor.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import Persons
import UIKit

protocol PersonsDetailBusinessLogic {
  func tryGetFileData(request: PersonsDetail.Data.Request)
}

protocol PersonsDetailDataStore {
  var incommingPerson: Person { get set }
}

class PersonsDetailInteractor: PersonsDetailBusinessLogic, PersonsDetailDataStore {
  var presenter: PersonsDetailPresentationLogic?
  var incommingPerson: Person = Person(
    firstName: "",
    surname: "",
    dateOfBirth: Date(),
    issueCount: 0
  )
  var resultingData: [[String]] = []

  // MARK: Do

  func tryGetFileData(request _: PersonsDetail.Data.Request) {
    let response = PersonsDetail.Data.Response(
      name: incommingPerson.firstName,
      surname: incommingPerson.surname,
      issuesCount: incommingPerson.issueCount
    )
    presenter?.presentFileData(response: response)
  }
}
