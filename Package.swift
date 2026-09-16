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
            .exact("15.15.0")
        ),
        .package(
            url: "https://github.com/taurusxteam/taurusx-ads-sdk-ios.git",
            .exact("1.18.2")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-TaurusX/releases/download/15.15.0/TPTaurusXAdapter-15.15.0.xcframework.zip",
            checksum: "e5598ccbb708efac06b62e138eaea8099c02e2740898fd1d46ee6292b3063507"
        ),
    ]
)
