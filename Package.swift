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
            .exact("15.13.0")
        ),
        .package(
            url: "https://github.com/taurusxteam/taurusx-ads-sdk-ios.git",
            .exact("1.18.1")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-TaurusX/releases/download/15.13.0/TPTaurusXAdapter-15.13.0.xcframework.zip",
            checksum: "156cb30f23edec1c979909c971dea288430470c0cea3689ee77d3d3b5474e5e0"
        ),
    ]
)
