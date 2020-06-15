//
//  PersonsDetailView.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 15/06/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class PersonsDetailView: UIView {
  private struct ViewTraits {
    // Margins
    static let viewMargins = UIEdgeInsets(top: 15.0, left: 20.0, bottom: 15.0, right: 20.0)
    static let innerMargin: CGFloat = 10.0
    static let vMargin: CGFloat = 5.0

    // Size
    static let labelWidth: CGFloat = 130.0

    // Font size
    static let fontMedium: CGFloat = 16.0
  }

  enum Accessibility {
    struct Identifier {
      static var rootView = "PersonsDetailView"
      static var nameLabel = "nameLabel"
      static var nameValueLabel = "nameValueLabel"
      static var countLabel = "countLabel"
      static var countValueLabel = "countValueLabel"
    }
  }

  // MARK: Public

  let nameLabel: UILabel
  let nameValueLabel: UILabel
  let countLabel: UILabel
  let countValueLabel: UILabel

  override init(frame: CGRect) {
    // nameLabel
    nameLabel = UILabel()
    nameLabel.font = UIFont.boldSystemFont(ofSize: ViewTraits.fontMedium)
    nameLabel.textColor = .darkText
    nameLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel
    nameLabel.translatesAutoresizingMaskIntoConstraints = false

    // nameValueLabel
    nameValueLabel = UILabel()
    nameValueLabel.font = UIFont.systemFont(ofSize: ViewTraits.fontMedium)
    nameValueLabel.textColor = .systemBlue
    nameValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel
    nameValueLabel.translatesAutoresizingMaskIntoConstraints = false

    // countLabel
    countLabel = UILabel()
    countLabel.font = UIFont.boldSystemFont(ofSize: ViewTraits.fontMedium)
    countLabel.textColor = .darkText
    countLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel
    countLabel.translatesAutoresizingMaskIntoConstraints = false

    // countValueLabel
    countValueLabel = UILabel()
    countValueLabel.font = UIFont.systemFont(ofSize: ViewTraits.fontMedium)
    countValueLabel.textColor = .systemBlue
    countValueLabel.accessibilityIdentifier = Accessibility.Identifier.nameLabel
    countValueLabel.translatesAutoresizingMaskIntoConstraints = false

    // Init
    super.init(frame: frame)

    backgroundColor = .systemBackground
    accessibilityIdentifier = Accessibility.Identifier.rootView

    // Add subviews
    addSubview(nameLabel)
    addSubview(nameValueLabel)
    addSubview(countLabel)
    addSubview(countValueLabel)

    // Add constraints
    addCustomConstraints()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addCustomConstraints() {
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(
        equalTo: leadingAnchor,
        constant: ViewTraits.viewMargins.left
      ),
      nameLabel.topAnchor.constraint(
        equalTo: safeAreaLayoutGuide.topAnchor,
        constant: ViewTraits.viewMargins.top
      ),
      nameLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

      nameValueLabel.leadingAnchor.constraint(
        equalTo: nameLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      nameValueLabel.topAnchor.constraint(
        equalTo: safeAreaLayoutGuide.topAnchor,
        constant: ViewTraits.viewMargins.top
      ),
      nameValueLabel.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -ViewTraits.viewMargins.right
      ),

      countLabel.leadingAnchor.constraint(
        equalTo: leadingAnchor,
        constant: ViewTraits.viewMargins.left
      ),
      countLabel.topAnchor.constraint(
        equalTo: nameValueLabel.bottomAnchor,
        constant: ViewTraits.vMargin
      ),
      countLabel.widthAnchor.constraint(equalToConstant: ViewTraits.labelWidth),

      countValueLabel.leadingAnchor.constraint(
        equalTo: countLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      countValueLabel.topAnchor.constraint(
        equalTo: nameValueLabel.bottomAnchor,
        constant: ViewTraits.vMargin
      ),
      countValueLabel.trailingAnchor.constraint(
        equalTo: trailingAnchor,
        constant: -ViewTraits.viewMargins.right
      ),
    ])
  }
}
