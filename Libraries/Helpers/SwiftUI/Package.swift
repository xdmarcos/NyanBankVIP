// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "SwiftUIHelpers",
  platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
  products: [
    .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
  ],
  targets: [
    .target(name: "SwiftUIHelpers", path: "Sources"),
  ],
  swiftLanguageVersions: [.v5]
)
