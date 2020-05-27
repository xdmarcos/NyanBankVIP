//
//  RootViewController.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import UIKit

class RootViewController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewControllers = [PersonsListViewController()]
    view.backgroundColor = .systemBackground
  }
}

