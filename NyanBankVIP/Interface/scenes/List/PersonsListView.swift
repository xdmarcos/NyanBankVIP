//
//  PersonsListView.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

class PersonsListView: UIView {
  private struct ViewTraits {
    // Margins
    static let topMargin: CGFloat = 15.0
    static let bottomMargin: CGFloat = 50.0

    // Heights
    static let viewHeight: CGFloat = 150.0
  }

  // MARK: Public

  let simpleView: UIView

  override init(frame: CGRect) {
    // simpleView
    simpleView = UIView()
    simpleView.backgroundColor = .red

    // Init
    super.init(frame: frame)

    backgroundColor = .systemBackground

    // Add subviews
    addSubview(simpleView)

    // Add constraints
    simpleView.translatesAutoresizingMaskIntoConstraints = false

    addCustomConstraints()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addCustomConstraints() {
    NSLayoutConstraint.activate([
      // Horizontal
      // Remember to use safeAreaLayoutGuide if iOS 11 and up
      simpleView.leadingAnchor.constraint(equalTo: leadingAnchor),
      simpleView.trailingAnchor.constraint(equalTo: trailingAnchor),

      // Vertical
      simpleView.topAnchor.constraint(equalTo: topAnchor),
      simpleView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ])
  }
}
