//
//  Person.swift
//  NyanBankVIP
//
//  Created by xdmgzdev on 25/05/2020.
//  Copyright © 2020 Rabobank. All rights reserved.
//

import Foundation

public struct Person {
  public let firstName: String
  public let surname: String
  public let dateOfBirth: Date
  public let issueCount: UInt
  
  public init(firstName: String, surname: String, dateOfBirth: Date, issueCount: UInt) {
    self.firstName = firstName
    self.surname = surname
    self.dateOfBirth = dateOfBirth
    self.issueCount = issueCount
  }
}

extension Person: Codable {
  enum CodingKeys: String, CodingKey {
    case firstName = "First name"
    case surname = "Sur name"
    case dateOfBirth = "Date of birth"
    case issueCount = "Issue count"
  }
}

extension Person: Hashable {}
