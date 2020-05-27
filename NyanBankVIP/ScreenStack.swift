//
//  ScreenStack.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 26/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

protocol ScreenStack {
  func createScreenStack(windowScene: UIWindowScene) -> UIWindow
}

extension ScreenStack {
  func createScreenStack(windowScene: UIWindowScene) -> UIWindow {
    let rootVC = RootViewController()
    let window = UIWindow(windowScene: windowScene)
    window.backgroundColor = .systemBackground
    window.rootViewController = rootVC

    return window
  }
}
