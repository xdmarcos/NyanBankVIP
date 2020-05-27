//
//  SceneDelegate.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, ScreenStack {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo _: UISceneSession,
    options _: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = createScreenStack(windowScene: windowScene)
    window?.makeKeyAndVisible()
    window?.windowScene = windowScene
  }
}
