// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Emojica",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Emojica",
            targets: ["Emojica"]),
    ],
    targets: [
        .target(
            name: "Emojica",
            path: "Source",
            exclude: ["Info.plist"]),
        .testTarget(
            name: "EmojicaTests",
            dependencies: ["Emojica"],
            path: "EmojicaTests"),
    ]
)
