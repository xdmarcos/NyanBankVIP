// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Persons",
  platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
  products: [
    .library(
      name: "Persons",
      targets: ["Persons"]
    ),
  ],
  dependencies: [
    .package(path: "../../Helpers/CSVImporter"),
    .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
    .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
  ],
  targets: [
    .target(
      name: "Persons",
      dependencies: ["CSVImporter"]
    ),
    .testTarget(
      name: "PersonsTests",
      dependencies: ["Persons", "Nimble", "Quick"]
    ),
  ],
  swiftLanguageVersions: [.v5]
)
