//
//  ActivityHUD.swift
//  NyanBank
//
//  Created by Andris Lejasmeiers on 05/01/2020.
//  Copyright © 2020 Andris Lejasmeiers. All rights reserved.
//

import SwiftUI

public struct ActivityHUD: View {
  private let action: () -> Void
  private let title: Text

  public init(action: @escaping () -> Void) {
    self.action = action
    title = Text("Loading...")
  }

  public init(_ title: Text, action: @escaping () -> Void) {
    self.action = action
    self.title = title
  }

  public var body: some View {
    GeometryReader { geometry in
      VStack {
        ActivityIndicator(
          isAnimating: .constant(true),
          hidesWhenStopped: .constant(false),
          style: .constant(.large),
          color: .constant(nil)
        )
        self.title
        Divider()
        Button("Cancel", action: self.action).foregroundColor(Color.blue)
      }
      .padding()
      .frame(maxWidth: geometry.size.width / 1.5)
      .background(Color(UIColor.tertiarySystemFill))
      .foregroundColor(Color.primary)
      .cornerRadius(20)
    }
  }

  #if DEBUG
  struct Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        Group {
          ActivityHUD {
            print("Cancelled")
          }
        }
        .background(Color.white)
        .colorScheme(.light)

        Group {
          ActivityHUD(Text("Please wait..")) {
            print("Cancelled")
          }
        }
        .background(Color.black)
        .colorScheme(.dark)
      }
    }
  }
  #endif
}
