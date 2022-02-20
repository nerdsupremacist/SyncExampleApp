// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SyncExampleApp",
    platforms: [.macOS(.v12), .iOS(.v15), .watchOS(.v7), .tvOS(.v15)],
    products: [
        .library(name: "App",
                 targets: ["App"]),
        .executable(name: "Server",
                    targets: ["Server"]),
    ],
    dependencies: [
        .package(name: "Sync", url: "https://github.com/nerdsupremacist/Sync.git", branch: "main"),
        .package(name: "SyncWebSocketClient", url: "https://github.com/nerdsupremacist/SyncWebSocketClient.git", branch: "main"),
        .package(name: "SyncWebSocketVapor", url: "https://github.com/nerdsupremacist/SyncWebSocketVapor.git", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(name: "App",
                dependencies: [
                    "Model",
                    "SyncWebSocketClient",
                ]),
        .executableTarget(name: "Server",
                          dependencies: [
                            "Model",
                            "SyncWebSocketVapor",
                            .product(name: "Vapor", package: "vapor"),
                          ]),
        .target(name: "Model",
                dependencies: [
                    "Sync",
                ]),
    ]
)
