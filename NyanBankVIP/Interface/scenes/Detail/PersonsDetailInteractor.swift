//
//  PersonsDetailInteractor.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailBusinessLogic {

    func doSomething(request: PersonsDetail.Something.Request)
}

protocol PersonsDetailDataStore {

    //var name: String { get set }
}

class PersonsDetailInteractor: PersonsDetailBusinessLogic, PersonsDetailDataStore {

    var presenter: PersonsDetailPresentationLogic?
    var worker: PersonsDetailWorker?
    //var name: String = ""

    // MARK: Do something
    func doSomething(request: PersonsDetail.Something.Request) {

        worker = PersonsDetailWorker()
        worker?.doSomeWork()

        let response = PersonsDetail.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

// MARK: Output --- Present something
extension PersonsDetailInteractor {

}
