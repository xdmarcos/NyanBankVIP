//
//  Person.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 31/12/2019.
//  Copyright © 2019 Andris Lejasmeiers. All rights reserved.
//

import Foundation

public struct Person {
  let firstName: String
  let surname: String
  let birthDate: Date
  let issueCount: UInt
}

extension Person: Codable {
  enum CodingKeys: String, CodingKey {
    case firstName = "First name"
    case surname = "Sur name"
    case birthDate = "Date of birth"
    case issueCount = "Issue count"
  }
}

extension Person: Hashable {}
