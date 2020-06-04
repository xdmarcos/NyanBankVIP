//
//  PersonsListView.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class PersonsListView: UIView {
  private struct ViewTraits {

    // Margins
    static let tableContentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    // TV
    static let estimatedRowHeight: CGFloat = 65.0
  }

  enum Accessibility {

    struct Identifier {
      static let rootView = "PersonsView"
      static let tableView = "PersonsTableView"
    }
  }

  // MARK: Public
  let tableView: UITableView

  override init(frame: CGRect) {

    //tableView
    tableView = UITableView(frame: .zero, style: .plain)
    tableView.backgroundColor = .systemBackground
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
    tableView.contentInsetAdjustmentBehavior = .never
    tableView.showsVerticalScrollIndicator = false
    tableView.showsHorizontalScrollIndicator = false
    tableView.contentInset = ViewTraits.tableContentInset
    tableView.accessibilityIdentifier = Accessibility.Identifier.tableView
    tableView.translatesAutoresizingMaskIntoConstraints = false

    // Init
    super.init(frame: frame)
    backgroundColor = .systemBackground

    // Add subviews
    addSubview(tableView)

    addCustomConstraints()
  }

  required init?(coder aDecoder: NSCoder) {

    fatalError("init(coder:) has not been implemented")
  }

  private func addCustomConstraints() {

    NSLayoutConstraint.activate([

      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
  }
}
