// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "LibPackage",
    products: [
        .library(
            name: "Lib",
            targets: ["Lib"]
        ),
    ],
    targets: [
        .target(
            name: "Lib"
        ),
    ],
    swiftLanguageModes: [.v6]
)
