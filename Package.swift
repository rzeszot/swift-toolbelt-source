// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Toolbelt",
    platforms: [
        .iOS(.v13),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Toolbelt",
            type: .dynamic,
            targets: [
                "Toolbelt",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Toolbelt"
        ),
    ]
)
