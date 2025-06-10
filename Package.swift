// swift-tools-version: 6.1

import PackageDescription

let package = Package(
	name: "LocalizationToolbox",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v16),
		.macCatalyst(.v16),
		.macOS(.v13),
		.tvOS(.v16),
		.visionOS(.v1),
		.watchOS(.v9),
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

		.trait(
			name: "LocalizationToolboxLegacy",
			description: "Enables additional overloads that Apple now provides by default.",
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
