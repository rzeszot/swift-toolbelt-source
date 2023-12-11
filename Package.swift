// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Toolbelt",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Toolbelt",
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
