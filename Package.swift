// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusTaurusXAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusTaurusXAdapter",
            targets: ["TradPlusTaurusXAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/taurusxteam/taurusx-ads-sdk-ios.git",
            .exact("1.20.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusTaurusXAdapter",
            dependencies: [
                .target(name: "TPTaurusXAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "TaurusxAdsSDK", package: "taurusx-ads-sdk-ios"),
            ],
            path: ".",
            sources: ["Sources/TradPlusTaurusXAdapter/TradPlusTaurusXAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPTaurusXAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-TaurusX/releases/download/15.18.0/TPTaurusXAdapter-15.18.0.xcframework.zip",
            checksum: "99b2dfef3b1755ec14e9aea19c66fa8b175055ce5a425a6832715b525a57cd4b"
        ),
    ]
)
