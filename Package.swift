// swift-tools-version: 6.1
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
    targets: [
        .target(
            name: "Nebula",
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
