// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sky",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Sky",
            targets: ["Sky"]),
        .library(
            name: "Sky-AppKit",
            targets: ["Sky-AppKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/es-kumagai/Swim", .branch("master")),
        .package(url: "https://github.com/es-kumagai/Ocean", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Sky",
            dependencies: ["Sky-AppKit", "Ocean"]),
        .target(
            name: "Sky-AppKit",
            dependencies: ["Ocean", "Swim"]),
        .testTarget(
            name: "SkyTests",
            dependencies: ["Sky"]),
        .testTarget(
            name: "Sky-AppKitTests",
            dependencies: ["Sky-AppKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
