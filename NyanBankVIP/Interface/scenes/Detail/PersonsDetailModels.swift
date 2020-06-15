//
//  PersonsDetailModels.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 2020.
//

import UIKit

enum PersonsDetail {
  // MARK: Use cases

  enum Data {
    struct Request {}

    struct Response {
      let name: String
      let surname: String
      let issuesCount: UInt
    }

    struct ViewModel {
      let screenTitle: String
      let nameLabel = NSLocalizedString("Name:", comment: "")
      let nameValue: String
      let countLabel = NSLocalizedString("Issues count:", comment: "")
      let countValue: String
    }
  }
}
