// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VooseyBridge",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v5)
	],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VooseyBridge",
            targets: ["VooseyBridge"]),
    ],
    dependencies: [
		.package(url: "https://\("ghp_KbnPDE1nrX3Ir1sAdU1INkt3i" + "cagio11gRmz"):x-oauth-basic@github.com/JustinMeans/JBS", .branch("main")),
//		.package(name: "JBS", path: "/Users/JustinMeans/documents/JMLLC/JWS/JBS")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "VooseyBridge",
            dependencies: [
				.product(name: "JBSNews", package: "JBS"),
				.product(name: "JBSAuth", package: "JBS"),
				.product(name: "JBSModerate", package: "JBS")
			]),
        .testTarget(
            name: "VooseyBridgeTests",
            dependencies: ["VooseyBridge"]),
    ]
)
