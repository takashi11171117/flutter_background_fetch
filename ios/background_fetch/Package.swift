// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "background_fetch",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(
            name: "background-fetch",
            targets: ["background_fetch"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "background_fetch",
            dependencies: ["TSBackgroundFetch"],
            resources: [
                .process("PrivacyInfo.xcprivacy"),
            ],
            cSettings: [
                .headerSearchPath("include/background_fetch")
            ]
        ),
        .binaryTarget(
            name: "TSBackgroundFetch",
            path: "Frameworks/TSBackgroundFetch.xcframework"
        )
    ]
)
