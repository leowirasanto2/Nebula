// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Nebula",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Nebula",
            targets: ["Nebula"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "Nebula",
            dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            path: "Sources/Nebula",
            exclude: [],
            resources: [
                .process("Illustrations/IllustrationsCatalog.xcassets")
            ]
        ),
        .testTarget(
            name: "NebulaTests",
            dependencies: ["Nebula"],
            path: "Tests/NebulaTests"
        )
    ]
)
