// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [
        .macOS(.v10_14), .iOS(.v16)
    ],
    products: [
        .library(
            name: "MyLibrary",
            targets: ["MyLibrary"]
        ),
        .executable(
            name: "transcribe",
            targets: ["MyLibraryCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/huggingface/swift-transformers.git", revision: "564442fba36b0b694d730a62d0593e5f54043b55"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", exact: "1.3.0"),
    ],
    targets: [
        .target(
            name: "MyLibrary",
            dependencies: [
                .product(name: "Transformers", package: "swift-transformers"),
            ]
        ),
        .executableTarget(
            name: "MyLibraryCLI",
            dependencies: [
                "MyLibrary",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "MyLibraryTests",
            dependencies: [
                "MyLibrary",
                .product(name: "Transformers", package: "swift-transformers"),
            ]
        ),
    ]
)
