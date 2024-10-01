// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sky",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Sky",
            targets: ["Sky"]),
        .library(
            name: "Sky-Base",
            targets: ["Sky-Base"]),
        .library(
            name: "Sky-AppKit",
            targets: ["Sky-AppKit"]),
        .library(
            name: "Sky-JavaScriptCore",
            targets: ["Sky-JavaScriptCore"]),
        .library(
            name: "Sky-WebKit",
            targets: ["Sky-WebKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/es-kumagai/Swim", from: "0.2.7"),
        .package(url: "https://github.com/es-kumagai/Ocean", from: "0.3.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Sky",
            dependencies: ["Sky-Base", "Sky-AppKit", "Sky-JavaScriptCore", "Sky-WebKit", "Ocean"]),
        .target(
            name: "Sky-Base",
            dependencies: ["Ocean", "Swim"]),
        .target(
            name: "Sky-AppKit",
            dependencies: ["Sky-Base", "Ocean", "Swim"]),
        .target(
            name: "Sky-JavaScriptCore",
            dependencies: []),
        .target(
            name: "Sky-WebKit",
            dependencies: ["Swim"]),
        .testTarget(
            name: "SkyTests",
            dependencies: ["Sky"]),
        .testTarget(
            name: "Sky-BaseTests",
            dependencies: ["Sky-Base"]),
        .testTarget(
            name: "Sky-AppKitTests",
            dependencies: ["Sky-AppKit"]),
        .testTarget(
            name: "Sky-JavaScriptCoreTests",
            dependencies: ["Sky-JavaScriptCore"]),
        .testTarget(
            name: "Sky-WebKitTests",
            dependencies: ["Sky-WebKit"]),
    ],
    swiftLanguageModes: [.v6]
)
