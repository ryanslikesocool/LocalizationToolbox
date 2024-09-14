// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "LocalizationTable",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v12),
		.iOS(.v15),
		.tvOS(.v15),
		.watchOS(.v8),
		.visionOS(.v1),
	],
	products: [
		.library(name: "LocalizationTable", targets: ["LocalizationTable"]),
	],
	targets: [
		.target(name: "LocalizationTable"),
	]
)
