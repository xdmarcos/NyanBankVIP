//
//  PersonsDetailViewController.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

protocol PersonsDetailDisplayLogic: class {
  func displayFileData(viewModel: PersonsDetail.Data.ViewModel)
}

class PersonsDetailViewController: UIViewController {
  var interactor: PersonsDetailBusinessLogic?
  var router: (PersonsDetailRoutingLogic & PersonsDetailDataPassing)?

  let sceneView = PersonsDetailView()

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

    navigationItem.backBarButtonItem?.action = #selector(goBack)

    askForFileData()
  }

  // MARK: Actions

  @objc func goBack() {
    prepareForGoBack()
  }
}

// MARK: Output --- Do something

extension PersonsDetailViewController {
  func askForFileData() {
    let request = PersonsDetail.Data.Request()
    interactor?.tryGetFileData(request: request)
  }
}

// MARK: Input --- Display something

extension PersonsDetailViewController: PersonsDetailDisplayLogic {
  func displayFileData(viewModel: PersonsDetail.Data.ViewModel) {
    title = viewModel.screenTitle
    sceneView.nameLabel.text = viewModel.nameLabel
    sceneView.nameValueLabel.text = viewModel.nameValue
    sceneView.countLabel.text = viewModel.countLabel
    sceneView.countValueLabel.text = viewModel.countValue
  }
}

// MARK: Routing --- Navigate next scene

extension PersonsDetailViewController {
  func prepareForGoBack() {
    router?.navigateBack()
  }
}
