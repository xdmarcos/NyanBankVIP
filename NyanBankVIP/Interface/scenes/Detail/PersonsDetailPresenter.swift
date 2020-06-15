//
//  PersonsDetailPresenter.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailPresentationLogic {

    func presentSomething(response: PersonsDetail.Something.Response)
}

class PersonsDetailPresenter: PersonsDetailPresentationLogic {

    weak var viewController: PersonsDetailDisplayLogic?

    // MARK: Do something
    func presentSomething(response: PersonsDetail.Something.Response) {
        
        let viewModel = PersonsDetail.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}

// MARK: Output --- Display something
extension PersonsDetailPresenter {

}
