// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DAWNCompatibleInstanceList",
    platforms: [.macOS(.v13), .iOS(.v17)],
    products: [
        .library(
            name: "InstanceListUI",
            targets: [
                "InstanceList",
                "InstanceListUI",
            ]
        )
    ],
    targets: [
        .target(
            name: "InstanceList",
            resources: [
                .copy("Resources/data.json")
            ]
        ),
        .target(
            name: "InstanceListUI",
            dependencies: [
                "InstanceList",
            ]
        ),
        .testTarget(
            name: "InstanceListTests",
            dependencies: [
                "InstanceList"
            ]
        ),
        .executableTarget(
            name: "MakeJson"
        ),
    ]
)
