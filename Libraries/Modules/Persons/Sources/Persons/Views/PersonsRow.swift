//
//  PersonsRow.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 31/12/2019.
//  Copyright © 2019 Andris Lejasmeiers. All rights reserved.
//

import SwiftUI

struct PersonsRow: View {
  let viewModel: PersonsRowViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(viewModel.name)
      HStack(alignment: .top) {
        VStack(alignment: .leading) {
          Text("Age").modifier(CaptionModifier())
          Text(viewModel.age)
        }
        Spacer()
        VStack(alignment: .leading) {
          Text("Issues").modifier(CaptionModifier())
          Text(viewModel.issueCount)
        }
      }
    }
  }

  // MARK: - Modifiers

  struct CaptionModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.caption)
        .foregroundColor(.gray)
    }
  }

  // MARK: - Previews

  #if DEBUG
  struct Previews: PreviewProvider {
    static var previews: some View {
      Group {
        PersonsRow(
          viewModel: PersonsRowViewModel(
            id: 0,
            name: "Jane Fox",
            age: "27",
            issueCount: "6"
          ))
        PersonsRow(
          viewModel: PersonsRowViewModel(
            id: 1,
            name: "",
            age: "",
            issueCount: ""
          ))
        PersonsRow(
          viewModel: PersonsRowViewModel(
            id: 2,
            name: "Donec ullamcorper nulla non metus auctor fringilla.",
            age: "-",
            issueCount: "0"
          ))
      }.previewLayout(.sizeThatFits)
    }
  }
  #endif
}
