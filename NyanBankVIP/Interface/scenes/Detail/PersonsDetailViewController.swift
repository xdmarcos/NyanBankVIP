//
//  PersonsDetailViewController.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailDisplayLogic: class {

    func displaySomething(viewModel: PersonsDetail.Something.ViewModel)
}

class PersonsDetailViewController: UIViewController {

    var interactor: PersonsDetailBusinessLogic?
    var router: (PersonsDetailRoutingLogic & PersonsDetailDataPassing)?

    private lazy var sceneView = PersonsDetailView()

    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup
    private func setup() {

        let viewController = self
        let interactor = PersonsDetailInteractor()
        let presenter = PersonsDetailPresenter()
        let router = PersonsDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    override func loadView() {
        view = sceneView
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        doSomething()
    }
}

// MARK: Output --- Do something
extension PersonsDetailViewController {

    func doSomething() {

        let request = PersonsDetail.Something.Request()
        interactor?.doSomething(request: request)
    }
}

// MARK: Input --- Display something
extension PersonsDetailViewController: PersonsDetailDisplayLogic {

    func displaySomething(viewModel: PersonsDetail.Something.ViewModel) {

        //nameTextField.text = viewModel.name
    }
}

// MARK: Routing --- Navigate next scene
extension PersonsDetailViewController {

    private func prepareForNextScene() {

        //        router?.routeToNextScene()
    }
}
