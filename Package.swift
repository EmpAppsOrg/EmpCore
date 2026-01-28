// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "EmpCore",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(name: "EmpCore", targets: ["EmpCore"]),
    ],
    targets: [
        .target(name: "EmpCore"),
        .testTarget(name: "EmpCoreTests", dependencies: ["EmpCore"]),
    ],
)
