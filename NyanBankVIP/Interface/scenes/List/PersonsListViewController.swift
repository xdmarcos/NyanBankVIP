//
//  PersonsListViewController.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsListDisplayLogic: class {
  func displaySomething(viewModel: PersonsList.Something.ViewModel)
}

class PersonsListViewController: UIViewController {
  var interactor: PersonsListBusinessLogic?
  var router: (PersonsListRoutingLogic & PersonsListDataPassing)?

  private lazy var sceneView = PersonsListView()

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
    let interactor = PersonsListInteractor()
    let presenter = PersonsListPresenter()
    let router = PersonsListRouter()
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

extension PersonsListViewController {
  func doSomething() {
    let request = PersonsList.Something.Request()
    interactor?.doSomething(request: request)
  }
}

// MARK: Input --- Display something

extension PersonsListViewController: PersonsListDisplayLogic {
  func displaySomething(viewModel _: PersonsList.Something.ViewModel) {
    // nameTextField.text = viewModel.name
  }
}

// MARK: Routing --- Navigate next scene

extension PersonsListViewController {
  private func prepareForNextScene() {
    //        router?.routeToNextScene()
  }
}
