// swift-tools-version: 6.1
import PackageDescription

let dependencies: [Target.Dependency] = [
  .product(name: "Algorithms", package: "swift-algorithms"),
  .product(name: "Collections", package: "swift-collections"),
  .product(name: "ArgumentParser", package: "swift-argument-parser"),
  .product(name: "Shared", package: "Shared"),
]

let package = Package(
  name: "2016",
  platforms: [.macOS(.v13), .iOS(.v16), .watchOS(.v9), .tvOS(.v16)],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-algorithms.git",
      .upToNextMajor(from: "1.2.0")),
    .package(
      url: "https://github.com/apple/swift-collections.git",
      .upToNextMajor(from: "1.1.4")),
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      .upToNextMajor(from: "1.5.0")),
    .package(
      url: "https://github.com/swiftlang/swift-format.git",
      .upToNextMajor(from: "600.0.0")),
    .package(path: "Shared")
  ],
  targets: [
    .executableTarget(
      name: "AoC2016",
      dependencies: dependencies,
      resources: [.copy("Data")]
    ),
    .testTarget(
      name: "AoC2016Tests",
      dependencies: ["AoC2016"] + dependencies
    )
  ],
  swiftLanguageModes: [.v6]
)
