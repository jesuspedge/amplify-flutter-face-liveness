// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "face_liveness_detector",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "face_liveness_detector",
            targets: ["face_liveness_detector"]),
        // Add an additional product name that matches what Flutter is looking for
        .library(
            name: "face-liveness-detector",
            targets: ["face_liveness_detector"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "face_liveness_detector",
            dependencies: []),
        .testTarget(
            name: "face_liveness_detectorTests",
            dependencies: ["face_liveness_detector"]),
    ]
) 