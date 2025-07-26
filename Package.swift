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
            name: "Nebula"
        ),
        .testTarget(
            name: "NebulaTests",
            dependencies: ["Nebula"]
        ),
    ]
)
