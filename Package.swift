// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "LocalizationTable",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
		.tvOS(.v16),
		.watchOS(.v9),
		.visionOS(.v1),
	],
	products: [
		.library(name: "LocalizationTable", targets: ["LocalizationTable"]),
	],
	targets: [
		.target(name: "LocalizationTable"),
	]
)
