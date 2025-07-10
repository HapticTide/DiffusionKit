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
        .library(name: "ColorVector", targets: ["ColorVector"]),
        .library(name: "SpringInterpolation", targets: ["SpringInterpolation"]),
        .library(name: "MSDisplayLink", targets: ["MSDisplayLink"]),
    ],
    targets: [
        .target(name: "DiffusionKit", dependencies: [
            "ColorVector",
            "SpringInterpolation",
            "MSDisplayLink"
        ]),
        .target(name: "ColorVector"),
        .target(name: "SpringInterpolation"),
        .target(name: "MSDisplayLink"),
    ]
)
