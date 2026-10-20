// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "macos-process-sentinel",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "ProcessSentinelCore", targets: ["ProcessSentinelCore"]),
        .executable(name: "ProcessSentinelCLI", targets: ["ProcessSentinelCLI"])
    ],
    targets: [
        .target(name: "ProcessSentinelCore", path: "Sources/ProcessSentinelCore"),
        .executableTarget(name: "ProcessSentinelCLI", dependencies: ["ProcessSentinelCore"], path: "Sources/ProcessSentinelCLI"),
        .testTarget(name: "ProcessSentinelCoreTests", dependencies: ["ProcessSentinelCore"], path: "Tests/ProcessSentinelCoreTests")
    ]
)
