// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Persons",
  platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
  products: [
    .library(name: "Persons", targets: ["Persons"]),
  ],
  dependencies: [
    .package(path: "../../Helpers/CSVPublisher"),
    .package(url: "https://github.com/groue/CombineExpectations.git", from: "0.4.0"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
    .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
  ],
  targets: [
    .target(name: "Persons", dependencies: ["CSVPublisher"]),
    .testTarget(
      name: "PersonsTests",
      dependencies: ["Persons", "CombineExpectations", "Nimble", "Quick"]
    ),
  ]
)
