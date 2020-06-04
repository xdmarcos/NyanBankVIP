// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSVImporter",
    platforms: [.iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macOS(.v10_15)],
    products: [
        .library(
            name: "CSVImporter",
            targets: ["CSVImporter"]),
    ],
    dependencies: [
      .package(url: "https://github.com/yaslab/CSV.swift.git", from: "2.4.3"),
      .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
      .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
    ],
    targets: [
        .target(
            name: "CSVImporter",
            dependencies: [.product(name: "CSV", package: "CSV.swift")]),
        .testTarget(
            name: "CSVImporterTests",
            dependencies: ["CSVImporter", "Nimble", "Quick"]),
    ],
    swiftLanguageVersions: [.v5]
)
