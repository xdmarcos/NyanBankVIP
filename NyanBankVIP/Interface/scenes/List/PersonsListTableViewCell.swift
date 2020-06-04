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
      static var symbolLabel = "symbolLabel"
      static var pathLabel = "valueLabel"
    }
  }

  let titleLabel: UILabel
  let symbolLabel: UILabel
  let pathLabel: UILabel
  private let separatorView: UIView

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    // symbolLabel
    symbolLabel = UILabel()
    symbolLabel.font = .boldSystemFont(ofSize: ViewTraits.fontBig)
    symbolLabel.textColor = .systemGray
    symbolLabel.backgroundColor = .systemBackground
    symbolLabel.textAlignment = .center
    symbolLabel.accessibilityIdentifier = Accessibility.Identifier.symbolLabel
    symbolLabel.translatesAutoresizingMaskIntoConstraints = false

    // titleLabel
    titleLabel = UILabel()
    titleLabel.font = .boldSystemFont(ofSize: ViewTraits.fontMedium)
    titleLabel.textColor = .systemGray
    titleLabel.accessibilityIdentifier = Accessibility.Identifier.titleLabel
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    // pathLabel
    pathLabel = UILabel()
    pathLabel.font = .systemFont(ofSize: ViewTraits.fontSmall)
    pathLabel.textColor = .systemGray
    pathLabel.textAlignment = .left
    pathLabel.lineBreakMode = .byTruncatingHead
    pathLabel.numberOfLines = ViewTraits.numberOfLines
    pathLabel.accessibilityIdentifier = Accessibility.Identifier.pathLabel
    pathLabel.translatesAutoresizingMaskIntoConstraints = false

    // separatorView
    separatorView = UIView()
    separatorView.backgroundColor = .systemGray
    separatorView.translatesAutoresizingMaskIntoConstraints = false

    super.init(style: style, reuseIdentifier: reuseIdentifier)

    selectionStyle = .none
    backgroundColor = .systemBackground

    // Add subviews
    contentView.addSubview(symbolLabel)
    contentView.addSubview(titleLabel)
    contentView.addSubview(pathLabel)
    contentView.addSubview(separatorView)

    // Add constraints
    addCustomConstraints()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    titleLabel.text = ""
    symbolLabel.text = ""
    pathLabel.text = ""
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addCustomConstraints() {
    NSLayoutConstraint.activate([
      symbolLabel.leadingAnchor.constraint(
        equalTo: contentView.leadingAnchor,
        constant: ViewTraits.innerMargin
      ),
      symbolLabel.widthAnchor.constraint(equalToConstant: ViewTraits.typeWidth),
      symbolLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

      titleLabel.leadingAnchor.constraint(
        equalTo: symbolLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      titleLabel.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -ViewTraits.cellMargins.right
      ),
      titleLabel.topAnchor.constraint(
        equalTo: contentView.topAnchor,
        constant: ViewTraits.cellMargins.top
      ),

      pathLabel.leadingAnchor.constraint(
        equalTo: symbolLabel.trailingAnchor,
        constant: ViewTraits.innerMargin
      ),
      pathLabel.trailingAnchor.constraint(
        equalTo: contentView.trailingAnchor,
        constant: -ViewTraits.cellMargins.right
      ),
      pathLabel.topAnchor.constraint(
        equalTo: titleLabel.bottomAnchor,
        constant: ViewTraits.vMargin
      ),
      pathLabel.bottomAnchor.constraint(
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
