//
//  PersonsListView.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 31/12/2019.
//  Copyright © 2019 Andris Lejasmeiers. All rights reserved.
//

import Combine
import SwiftUI

public struct PersonsListView: View {
  @ObservedObject var viewModel: PersonListViewModel

  public init(viewModel: PersonListViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    List(viewModel.dataSource) { element in
      PersonsRow(viewModel: element)
    }
  }

  #if DEBUG
  struct Previews: PreviewProvider {
    static var previews: some View {
      let viewModel = PersonListViewModel()
      viewModel
        .dataSource
        .append(PersonsRowViewModel(id: 0, name: "Jane", age: "27", issueCount: "2"))
      viewModel
        .dataSource
        .append(PersonsRowViewModel(id: 1, name: "Anna", age: "24", issueCount: "1"))
      return PersonsListView(viewModel: viewModel)
    }
  }
  #endif
}
