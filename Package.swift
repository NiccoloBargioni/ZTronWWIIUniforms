// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZTronWWIIUniforms",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ZTronWWIIUniforms",
            targets: ["ZTronWWIIUniforms"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/lukaskubanek/LoremIpsum", branch: "master"
        ),
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/exyte/ScalingHeaderScrollView", branch: "master"
        ),
        .package(
            url: "https://github.com/siteline/swiftui-introspect", branch: "main"
        ),
        .package(
            url: "https://github.com/dankinsoid/VDAnimation", branch: "master"
        ),
        .package(
            url: "https://github.com/NiccoloBargioni/ZTronRouter", branch: "main"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ZTronWWIIUniforms",
            dependencies: [
                .product(name: "LoremIpsum", package: "LoremIpsum"),
                .product(name: "ScalingHeaderScrollView", package: "ScalingHeaderScrollView"),
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "VDAnimation", package: "VDAnimation"),
                .product(name: "ZTronRouter", package: "ZTronRouter")
            ]
        ),
        .testTarget(
            name: "ZTronWWIIUniformsTests",
            dependencies: ["ZTronWWIIUniforms"]
        ),
    ]
)
