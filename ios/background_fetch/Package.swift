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
    dependencies: [
        .package(url: "https://github.com/transistorsoft/transistor-background-fetch.git", from: "4.0.3")
    ],
    targets: [
        .target(
            name: "background_fetch",
            dependencies: [
                .product(name: "TSBackgroundFetch", package: "transistor-background-fetch")
            ],
            cSettings: [
                .headerSearchPath("include/background_fetch")
            ]
        )        
    ]
)
