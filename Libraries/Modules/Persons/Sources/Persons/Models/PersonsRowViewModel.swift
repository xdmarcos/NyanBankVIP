//
//  PersonsRowViewModel.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 31/12/2019.
//  Copyright © 2019 Andris Lejasmeiers. All rights reserved.
//

import Foundation

struct PersonsRowViewModel: Identifiable {
  let id: Int32
  let name: String
  let age: String
  let issueCount: String
}
