// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "SwiftGen",
    products: [
        .executable(
			name: "swiftgen",
			targets: ["SwiftGen"]
		),
        .library(
			name: "SwiftGenKit",
			targets: ["SwiftGenKit"]
		),
    ],
    dependencies: [
        .package(url: "https://github.com/kylef/Commander.git", .upToNextMajor(from: "0.8.0")),
        .package(url: "https://github.com/kylef/PathKit.git", .upToNextMajor(from: "0.9.0")),
        .package(url: "https://github.com/kylef/Stencil.git", .upToNextMajor(from: "0.13.0")),
        .package(url: "https://github.com/jpsim/Yams.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", .upToNextMajor(from: "2.7.0")),
        .package(url: "https://github.com/tid-kijyun/Kanna.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(
			name: "SwiftGen",
			dependencies: [
				"Commander",
				"Kanna",
				"PathKit",
				"Stencil",
				"StencilSwiftKit",
				"SwiftGenKit",
				"Yams"
			],
			path: "Sources/SwiftGen",
			linkerSettings: [
				.linkedLibrary("xml2")
			]
		),
        .target(
			name: "SwiftGenKit",
			dependencies: [
			  "Kanna",
			  "PathKit",
			  "Yams"
			]
		),
        .testTarget(
			name: "SwiftGenKitTests",
			dependencies: ["SwiftGenKit"]
		),
        .testTarget(
			name: "SwiftGenTests",
			dependencies: ["SwiftGen"]
		),
        .testTarget(
			name: "TemplatesTests",
			dependencies: [
				"StencilSwiftKit",
				"SwiftGenKit"
			]
		)
    ],
    swiftLanguageVersions: [.v5]
)
