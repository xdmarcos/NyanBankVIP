// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "ClosureSubscription",
  platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
  products: [
    .library(name: "ClosureSubscription", targets: ["ClosureSubscription"]),
  ],
  targets: [
    .target(name: "ClosureSubscription", path: "Sources"),
  ],
  swiftLanguageVersions: [.v5]
)
