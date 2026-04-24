// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "AppPackage",
    dependencies: [
        .package(path: "../LibPackage"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(
                    name: "Lib",
                    package: "LibPackage",
                    moduleAliases: [
                        "Lib": "LibAlias",
                    ]
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
