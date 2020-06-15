//
//  PersonsDetailPresenter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailPresentationLogic {
  func presentFileData(response: PersonsDetail.Data.Response)
}

class PersonsDetailPresenter: PersonsDetailPresentationLogic {
  weak var viewController: PersonsDetailDisplayLogic?

  func presentFileData(response: PersonsDetail.Data.Response) {
    let screenTitle = "\(response.name) \(response.issuesCount)"
    let name = "\(response.name) \(response.surname)"
    let count = "\(response.issuesCount)"

    let viewModel = PersonsDetail.Data.ViewModel(
      screenTitle: screenTitle,
      nameValue: name,
      countValue: count
    )
    viewController?.displayFileData(viewModel: viewModel)
  }
}
