// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ToolbeltPackage",
    platforms: [
        .iOS(.v13),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "ToolbeltLibrary",
            type: .dynamic,
            targets: [
                "ToolbeltTarget",
            ]
        ),
    ],
    targets: [
        .target(
            name: "ToolbeltTarget"
        ),
    ]
)
