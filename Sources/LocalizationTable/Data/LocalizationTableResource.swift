import Foundation

/// A reference to a localization table, accessible from another process.
public struct LocalizationTableResource {
	public typealias BundleDescription = LocalizedStringResource.BundleDescription

	/// The name of the table containing the key-value pairs.
	public let name: String

	/// The bundle containing the table’s strings file.
	public let bundle: BundleDescription

	/// The locale to use to look up a localized string.
	public var locale: Locale

	/// Create a reference to a localization table.
	/// - Parameters:
	///   - name: The name of the table containing the key-value pairs.
	///   - bundle: The bundle containing the table’s strings file.
	///   - locale: The locale to use to look up a localized string.
	public init(
		_ name: String,
		bundle: BundleDescription = .main,
		locale: Locale = .current
	) {
		self.name = name
		self.bundle = bundle
		self.locale = locale
	}
}

// MARK: - Sendable

extension LocalizationTableResource: Sendable { }

// MARK: - Equatable

extension LocalizationTableResource: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.name == rhs.name
			&& lhs.bundle == rhs.bundle
			&& lhs.locale == rhs.locale
	}
}

// MARK: - ExpressibleByStringLiteral

extension LocalizationTableResource: ExpressibleByStringLiteral {
	public init(stringLiteral value: StringLiteralType) {
		self.init(value)
	}
}
