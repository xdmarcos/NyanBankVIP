//
//  PersonsListTableViewCell.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 04/06/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class PersonsListTableViewCell: UITableViewCell {
  static let reuseIdentifier = "PersonsListTableViewCellReuseIdentifier"
  private struct ViewTraits {
    // Margins
    static let cellMargins = UIEdgeInsets(top: 15.0, left: 10.0, bottom: 15.0, right: 10.0)
    static let innerMargin: CGFloat = 10.0
    static let vMargin: CGFloat = 5.0

    // Size
    static let typeWidth: CGFloat = 60.0
    static let typeHeight: CGFloat = 15.0
    static let separatorHeight: CGFloat = 1.0

    // Font size
    static let fontBig: CGFloat = 20.0
    static let fontMedium: CGFloat = 16.0
    static let fontSmall: CGFloat = 12.0

    // UI
    static let numberOfLines = 0
  }

  enum Accessibility {
    struct Identifier {
      static var titleLabel = "titleLabel"
      static var issuesLabel = "issuesLabel"
      static var symbolLabel = "symbolLabel"
      static var pathLabel = "valueLabel"
    }
  }

  let nameLabel: UILabel
  let issuesLabel: UILabel
  let issuesNumberLabel: UILabel
  let ageLabel: UILabel
  private let separatorView: UIView

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    // issuesNumberLabel
    issuesNumberLabel = UILabel()
    issuesNumberLabel.font = .boldSystemFont(ofSize: ViewTraits.fontBig)
    issuesNumberLabel.textColor = .systemGray
    issuesNumberLabel.backgroundColor = .systemBackground
    issuesNumberLabel.textAlignment = .center
    issuesNumberLabel.accessibilityIdentifier = Accessibility.Identifier.symbolLabel
    issuesNumberLabel.translatesAutoresizingMaskIntoConstraints = false

    // issuesLabel
    issuesLabel = UILabel()
    issuesLabel.font = .boldSystemFont(ofSize: ViewTraits.fontSmall)
    issuesLabel.textColor = .systemGray
    issuesLabel.backgroundColor = .systemBackground
    issuesLabel.textAlignment = .center
    issuesLabel.accessibilityIdentifier = Accessibility.Identifier.issuesLabel
    issuesLabel.translatesAutoresizingMaskIntoConstraints = false

    // nameLabel
    nameLabel = UILabel()
    nameLabel.font = .boldSystemFont(ofSize: ViewTraits.fontMedium)
    nameLabel.textColor = .systemGray
    nameLabel.accessibilityIdentifier = Accessibility.Identifier.titleLabel
    nameLabel.translatesAutoresizingMaskIntoConstraints = false

    // ageLabel
    ageLabel = UILabel()
    ageLabel.font = .systemFont(ofSize: ViewTraits.fontSmall)
    ageLabel.textColor = .systemGray
    ageLabel.textAlignment = .left
    ageLabel.lineBreakMode = .byTruncatingHead
    ageLabel.numberOfLines = ViewTraits.numberOfLines
    ageLabel.accessibilityIdentifier = Accessibility.Identifier.pathLabel
    ageLabel.translatesAutoresizingMaskIntoConstraints = false

    // separatorView
    separatorView = UIView()
    separatorView.backgroundColor = .systemGray
    separatorView.translatesAutoresizingMaskIntoConstraints = false

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    selectionStyle = .none
    backgroundColor = .systemBackground

    // Add subviews
    contentView.addSubview(issuesNumberLabel)
    contentView.addSubview(issuesLabel)
    contentView.addSubview(nameLabel)
    contentView.addSubview(ageLabel)
    contentView.addSubview(separatorView)

    // Add constraints
    addCustomConstraints()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    nameLabel.text = ""
    issuesNumberLabel.text = ""
    ageLabel.text = ""
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: Private

private extension PersonsListTableViewCell {
  func addCustomConstraints() {
    NSLayoutConstraint.activate([
      issuesNumberLabel.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor,
        constant: ViewTraits.innerMargin
      ),
      issuesNumberLabel.widthAnchor.constraint(equalToConstant: ViewTraits.typeWidth),
      issuesNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

      issuesLabel.leadingAnchor.constraint(equalTo: issuesNumberLabel.leadingAnchor),
      issuesLabel.trailingAnchor.constraint(equalTo: issuesNumberLabel.trailingAnchor),
      issuesLabel.topAnchor.constraint(equalTo: issuesNumberLabel.bottomAnchor),
      issuesLabel.heightAnchor.constraint(equalToConstant: ViewTraits.typeHeight),

      nameLabel.leadingAnchor.constraint(
        equalTo: issuesNumberLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      nameLabel.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -ViewTraits.cellMargins.right
      ),
      nameLabel.topAnchor.constraint(
        equalTo: contentView.topAnchor,
        constant: ViewTraits.cellMargins.top
      ),

      ageLabel.leadingAnchor.constraint(
        equalTo: issuesNumberLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      ageLabel.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -ViewTraits.cellMargins.right
      ),
      ageLabel.topAnchor.constraint(
        equalTo: nameLabel.bottomAnchor,
        constant: ViewTraits.vMargin
      ),
      ageLabel.bottomAnchor.constraint(
        equalTo: contentView.bottomAnchor,
        constant: -ViewTraits.cellMargins.bottom
      ),

      separatorView.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor,
        constant: ViewTraits.cellMargins.left
      ),
      separatorView.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -ViewTraits.cellMargins.right
      ),
      separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      separatorView.heightAnchor.constraint(equalToConstant: ViewTraits.separatorHeight),
    ])
  }
}
