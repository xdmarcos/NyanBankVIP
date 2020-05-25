// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "CSVPublisher",
  platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
  products: [
    .library(name: "CSVPublisher", targets: ["CSVPublisher"]),
  ],
  dependencies: [
    .package(path: "../Combine/ClosureSubscription"),
    .package(url: "https://github.com/groue/CombineExpectations.git", from: "0.4.0"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
    .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
    .package(url: "https://github.com/yaslab/CSV.swift.git", from: "2.4.3"),
  ],
  targets: [
    .target(
      name: "CSVPublisher",
      dependencies: ["ClosureSubscription", .product(name: "CSV", package: "CSV.swift")]
    ),
    .testTarget(
      name: "CSVPublisherTests",
      dependencies: ["CSVPublisher", "CombineExpectations", "Nimble", "Quick"]
    ),
  ],
  swiftLanguageVersions: [.v5]
)
