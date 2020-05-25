//
//  PersonsRowViewModel+Person.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 01/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import Foundation

extension PersonsRowViewModel {
  init(
    id: Int32,
    person: Person,
    ageReferenceDate date: Date = Date(),
    callendar: Calendar = Calendar.current
  ) {
    self.id = id
    name = Self.makeName(person: person)
    age = Self.makeAge(person: person, referenceDate: date, callendar: callendar)
    issueCount = String(person.issueCount)
  }
}

private extension PersonsRowViewModel {
  static func makeName(person: Person) -> String {
    [person.firstName, person.surname]
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
      .filter { !$0.isEmpty }
      .joined(separator: " ")
      .emptyReplaced(with: "-")
  }

  static func makeAge(
    person: Person,
    referenceDate reference: Date,
    callendar: Calendar
  ) -> String {
    let components = callendar
      .dateComponents([.year, .month, .day], from: person.birthDate, to: reference)
    return [
      (NSLocalizedString("%dy", comment: "Age in years"), components.year),
      (NSLocalizedString("%dm", comment: "Age in months"), components.month),
      (NSLocalizedString("%dd", comment: "Age in days"), components.day),
    ]
    .compactMap { $0.1 != nil && $0.1! > 0 ? String(format: $0.0, $0.1!) : nil }
    .joined(separator: " ")
    .emptyReplaced(with: "-")
  }
}

private extension String {
  func emptyReplaced(with replacement: String) -> String {
    isEmpty ? replacement : self
  }
}
