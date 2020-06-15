//
//  PersonsDetailHeaderFooterView.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 15/06/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class FileDetailHeaderFooterView: UITableViewHeaderFooterView {
  static let reuseIdentifier = "FileDetailHeaderFooterViewReuseIdentifier"
  private struct ViewTraits {
    // Margins
    static let labelMargins = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)

    // Heights
    static let labelHeight: CGFloat = 20.0

    // Label
    static let fontSize: CGFloat = 16.0
    static let numberOfLines = 1
  }

  // MARK: Public

  private let sectionHeaderWrapper: UIView
  let titleLabel: UILabel

  override init(reuseIdentifier: String?) {
    // sectionHeaderWrapper
    sectionHeaderWrapper = UIView()
    sectionHeaderWrapper.backgroundColor = .systemBackground

    // titleLabel
    titleLabel = UILabel()
    titleLabel.textColor = .lightText
    titleLabel.font = .boldSystemFont(ofSize: ViewTraits.fontSize)

    // Init
    super.init(reuseIdentifier: reuseIdentifier)

    backgroundColor = .systemBackground

    // Add subviews
    addSubview(sectionHeaderWrapper)
    sectionHeaderWrapper.addSubview(titleLabel)

    // Add constraints
    addCustomConstraints()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addCustomConstraints() {
    NSLayoutConstraint.activate([
      sectionHeaderWrapper.leadingAnchor.constraint(equalTo: leadingAnchor),
      sectionHeaderWrapper.trailingAnchor.constraint(equalTo: trailingAnchor),
      sectionHeaderWrapper.topAnchor.constraint(equalTo: topAnchor),
      sectionHeaderWrapper.bottomAnchor.constraint(equalTo: bottomAnchor),

      titleLabel.leadingAnchor.constraint(
        equalTo: sectionHeaderWrapper.leadingAnchor,
        constant: ViewTraits.labelMargins.left
      ),
      titleLabel.trailingAnchor.constraint(
        equalTo: sectionHeaderWrapper.trailingAnchor,
        constant: -ViewTraits.labelMargins.right
      ),
      titleLabel.centerYAnchor.constraint(equalTo: sectionHeaderWrapper.centerYAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: ViewTraits.labelHeight),
    ])
  }
}
