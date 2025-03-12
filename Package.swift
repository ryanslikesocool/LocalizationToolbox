// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "LocalizationToolbox",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
		.tvOS(.v16),
		.watchOS(.v9),
		.macCatalyst(.v13),
		.visionOS(.v1),
	],
	products: [
		.library(name: "LocalizationToolbox", targets: ["LocalizationToolbox"]),
	],
	targets: [
		.target(name: "LocalizationToolbox"),
	]
)