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
            .exact("15.17.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-TaurusX/releases/download/15.17.0/TPTaurusXAdapter-15.17.0.xcframework.zip",
            checksum: "a67098f283e216c55e68df64d2ead82a35fa5bdec44158f4ba50f1f5bfde139f"
        ),
    ]
)
