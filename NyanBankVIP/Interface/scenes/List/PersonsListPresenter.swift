//
//  PersonsListPresenter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsListPresentationLogic {
  func presentSomething(response: PersonsList.Something.Response)
}

class PersonsListPresenter: PersonsListPresentationLogic {
  weak var viewController: PersonsListDisplayLogic?

  // MARK: Do something

  func presentSomething(response _: PersonsList.Something.Response) {
    let viewModel = PersonsList.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}

// MARK: Output --- Display something

extension PersonsListPresenter {}
