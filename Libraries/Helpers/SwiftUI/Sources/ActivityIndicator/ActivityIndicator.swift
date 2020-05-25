//
//  ActivityIndicator.swift
//  ActivityIndicator
//
//  Created by Andris Lejasmeiers on 29/12/2019.
//

import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
  @Binding public var isAnimating: Bool
  @Binding public var hidesWhenStopped: Bool
  @Binding public var style: UIActivityIndicatorView.Style
  @Binding public var color: UIColor?

  public func makeUIView(
    context _: UIViewRepresentableContext<ActivityIndicator>
  ) -> UIActivityIndicatorView {
    UIActivityIndicatorView(style: style)
  }

  public func updateUIView(
    _ uiView: UIActivityIndicatorView,
    context _: UIViewRepresentableContext<ActivityIndicator>
  ) {
    isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    uiView.style = style
    if let color = self.color {
      uiView.color = color
    }
    uiView.hidesWhenStopped = hidesWhenStopped
  }

  #if DEBUG
  struct Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        ActivityIndicator(
          isAnimating: .constant(true),
          hidesWhenStopped: .constant(true),
          style: .constant(.medium),
          color: .constant(nil)
        )

        ActivityIndicator(
          isAnimating: .constant(true),
          hidesWhenStopped: .constant(true),
          style: .constant(.large),
          color: .constant(nil)
        )

        ActivityIndicator(
          isAnimating: .constant(false),
          hidesWhenStopped: .constant(false),
          style: .constant(.large),
          color: .constant(.systemBlue)
        )
      }.previewLayout(.sizeThatFits)
    }
  }
  #endif
}
