// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "DiffusionKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "DiffusionKit", targets: ["DiffusionKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/HapticTide/ColorVector", exact: "1.0.5"),
        .package(url: "https://github.com/HapticTide/MSDisplayLink", exact: "2.1.0"),
        .package(url: "https://github.com/HapticTide/SpringInterpolation", exact: "2.1.0"),
    ],
    targets: [
        .target(name: "DiffusionKit", dependencies: [
            .product(name: "ColorVector", package: "ColorVector"),
            .product(name: "MSDisplayLink", package: "MSDisplayLink"),
            .product(name: "SpringInterpolation", package: "SpringInterpolation"),
        ]),
    ]
)
