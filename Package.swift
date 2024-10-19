// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZTronWWIIUniforms",
    defaultLocalization: "en",
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
        
        .package(
            url: "https://github.com/exyte/ScalingHeaderScrollView", branch: "master"
        ),
        
        .package(
            url: "https://github.com/siteline/swiftui-introspect", branch: "main"
        ),

        .package(
            url: "https://github.com/NiccoloBargioni/ZTronRouter", branch: "main"
        ),
        
        .package(
            url: "https://github.com/jasudev/AxisTabView", branch: "main"
        ),
        
        .package(
            url: "https://github.com/joehinkle11/Lazy-View-SwiftUI", branch: "master"
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
                .product(name: "ZTronRouter", package: "ZTronRouter"),
                .product(name: "AxisTabView", package: "AxisTabView"),
                .product(name: "LazyViewSwiftUI", package: "Lazy-View-SwiftUI")
            ]
        ),
        .testTarget(
            name: "ZTronWWIIUniformsTests",
            dependencies: ["ZTronWWIIUniforms"]
        ),
    ]
)
