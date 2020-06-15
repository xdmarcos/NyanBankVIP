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
    static let innerMargin: CGFloat = 10.0
    // TV
    static let estimatedRowHeight: CGFloat = 65.0
    static let minAlpha: CGFloat = 0.0
    static let maxAlpha: CGFloat = 1.0
    static let animationDuration: TimeInterval = 0.7

    // Font size
    static let fontBig: CGFloat = 18.0
    static let fontMedium: CGFloat = 14.0
  }

  enum Accessibility {
    struct Identifier {
      static let rootView = "PersonsView"
      static let tableView = "PersonsTableView"
      static let titleLabel = "PersonsTitleLabel"
      static let descriptionLabel = "PersonsDescriptionLabel"
    }
  }

  // MARK: Public

  let titleLabel: UILabel
  let descriptionLabel: UILabel
  let tableView: UITableView

  override init(frame: CGRect) {
    titleLabel = UILabel()
    titleLabel.font = .boldSystemFont(ofSize: ViewTraits.fontBig)
    titleLabel.textColor = .black
    titleLabel.backgroundColor = .systemBackground
    titleLabel.textAlignment = .center
    titleLabel.accessibilityIdentifier = Accessibility.Identifier.titleLabel
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    descriptionLabel = UILabel()
    descriptionLabel.font = .systemFont(ofSize: ViewTraits.fontBig)
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textColor = .systemGray
    descriptionLabel.backgroundColor = .systemBackground
    descriptionLabel.textAlignment = .center
    descriptionLabel.accessibilityIdentifier = Accessibility.Identifier.descriptionLabel
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

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
    tableView.alpha = ViewTraits.minAlpha
    tableView.translatesAutoresizingMaskIntoConstraints = false

    // Init
    super.init(frame: frame)
    backgroundColor = .systemBackground

    // Add subviews
    addSubview(titleLabel)
    addSubview(descriptionLabel)
    addSubview(tableView)

    addCustomConstraints()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func showTableView() {
    UIView.animate(withDuration: ViewTraits.animationDuration) {
      self.tableView.alpha = ViewTraits.maxAlpha
    }
  }
}

// MARK: Private

private extension PersonsListView {
  func addCustomConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      descriptionLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
      descriptionLabel.topAnchor.constraint(
        equalTo: titleLabel.bottomAnchor,
        constant: ViewTraits.innerMargin
      ),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
    ])
  }
}
