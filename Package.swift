// swift-tools-version: 6.1

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
	traits: [
		.default(enabledTraits: []),

		.trait(
			name: "SFSymbolToolbox",
			description: "Enables additional overloads when using the [SFSymbolToolbox]( https://github.com/ryanslikesocool/SFSymbolToolbox ) package.",
			enabledTraits: []
		),
	],
	dependencies: [
		.package(url: "https://github.com/ryanslikesocool/SFSymbolToolbox", from: "0.0.3"),
	],
	targets: [
		.target(
			name: "LocalizationToolbox",
			dependencies: [
				.product(
					name: "SFSymbolToolbox",
					package: "SFSymbolToolbox",
					condition: .when(traits: ["SFSymbolToolbox"])
				),
			]
		),
	]
)
