import Foundation

public typealias BundleDescription = LocalizedStringResource.BundleDescription

// MARK: - Equatable

extension BundleDescription: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		switch (lhs, rhs) {
			case let (.atURL(lhs), .atURL(rhs)): lhs == rhs
			case let (.forClass(lhs), .forClass(rhs)): lhs == rhs
			case (.main, .main): true
			default: lhs.bundle == rhs.bundle
		}
	}
}

// MARK: - Convenience

public extension BundleDescription {
	@inlinable
	init(_ bundle: Bundle) {
		self = if bundle == Bundle.main {
			.main
		} else {
			.atURL(bundle.bundleURL)
		}
	}
}

// MARK: -

public extension BundleDescription {
	var bundle: Bundle? {
		switch self {
			case let .atURL(url): Bundle(url: url)
			case let .forClass(`class`): Bundle(for: `class`)
			case .main: Bundle.main
			default: fatalError("""
				\(Self.self) does not currently support the 'bundle' property.
				This is not intended.  Please file a bug report.
				""")
		}
	}
}
