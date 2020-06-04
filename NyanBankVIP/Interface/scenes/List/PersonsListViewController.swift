//
//  PersonsListViewController.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

typealias AlertHandler = (UIAlertAction) -> Void
protocol PersonsListDisplayLogic: class {
  func displayFileList(viewModel: PersonsList.Files.ViewModel)
  func displayPersonIssues(viewModel: PersonsList.Issues.ViewModel)
}

class PersonsListViewController: UIViewController {
  var interactor: PersonsListBusinessLogic?
  var router: (PersonsListRoutingLogic & PersonsListDataPassing)?

  private lazy var sceneView = PersonsListView()
  private var actionHandler: AlertHandler?
  private var datasource: [PersonsList.Issues.IssueInfo] = []

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

    navigationController?.navigationBar.prefersLargeTitles = true
    title = NSLocalizedString("Persons", comment: "Title for navigation bar")
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: NSLocalizedString("Load", comment: "Load button title"),
      style: .plain,
      target: self,
      action: #selector(loadFiles)
    )

    sceneView.tableView.register(
      PersonsListTableViewCell.self,
      forCellReuseIdentifier: PersonsListTableViewCell.reuseIdentifier
    )
    sceneView.tableView.delegate = self
    sceneView.tableView.dataSource = self

    actionHandler = { [weak self] action in
      guard let self = self else { return }
      guard let fileName = action.title else { return }
      self.tryGetIssues(file: fileName)
    }
  }

  @objc func loadFiles() {
    tryGetFileList()
  }
}

extension PersonsListViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in _: UITableView) -> Int {
    return 1
  }

  func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return datasource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(
      withIdentifier: PersonsListTableViewCell.reuseIdentifier,
      for: indexPath
    ) as? PersonsListTableViewCell {
      return configureCell(cell, forIndexPath: indexPath)
    }

    return UITableViewCell()
  }

  func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {}

  private func configureCell(
    _ cell: PersonsListTableViewCell,
    forIndexPath indexPath: IndexPath
  ) -> UITableViewCell {
    let issue = datasource[indexPath.row]
    cell.symbolLabel.text = issue.issueCount
    cell.titleLabel.text = issue.name
    cell.pathLabel.text = issue.age

    return cell
  }
}

// MARK: Output --- Do something

extension PersonsListViewController {
  func tryGetFileList() {
    let request = PersonsList.Files.Request()
    interactor?.doRetriveList(request: request)
  }

  func tryGetIssues(file: String) {
    let request = PersonsList.Issues.Request(fileName: file)
    interactor?.doRetriveIssues(request: request)
  }
}

// MARK: Input --- Display something

extension PersonsListViewController: PersonsListDisplayLogic {
  func displayFileList(viewModel: PersonsList.Files.ViewModel) {
    showFilesSelector(viewModel: viewModel)
  }

  func displayPersonIssues(viewModel: PersonsList.Issues.ViewModel) {
    guard viewModel.errorDescription == nil else {
      showError(errorDescription: viewModel.errorDescription ?? "")
      return
    }

    datasource = viewModel.issues
    sceneView.tableView.reloadData()
  }

  private func showError(errorDescription: String) {
    let alertVC = UIAlertController(
      title: NSLocalizedString("Error", comment: ""),
      message: errorDescription,
      preferredStyle: .alert
    )

    alertVC
      .addAction(UIAlertAction(
        title: NSLocalizedString("Ok", comment: ""),
        style: .cancel,
        handler: nil
      ))

    present(alertVC, animated: true, completion: nil)
  }
}

// MARK: Routing --- Navigate next scene

extension PersonsListViewController {
  private func prepareForNextScene() {
    //        router?.routeToNextScene()
  }
}

// MARK: Private

extension PersonsListViewController {
  func showFilesSelector(viewModel: PersonsList.Files.ViewModel) {
    let alertVC = UIAlertController(
      title: viewModel.alertTitle,
      message: viewModel.alertMessage,
      preferredStyle: .actionSheet
    )

    for option in viewModel.alertOptions {
      let action = UIAlertAction(title: option.title, style: option.style, handler: actionHandler)
      alertVC.addAction(action)
    }

    alertVC
      .addAction(UIAlertAction(
        title: NSLocalizedString("Cancel", comment: ""),
        style: .cancel,
        handler: nil
      ))

    present(alertVC, animated: true, completion: nil)
  }
}
