//
//  PersonsProvider.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 06/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import Combine

public protocol PersonsProvider {
  func loadResource(name: String) -> AnyPublisher<Person, Error>
}
