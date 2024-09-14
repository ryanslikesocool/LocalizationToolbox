import Foundation

/// A reusable container describing a localization table.
@frozen
public struct LocalizationTable {
	public typealias LocaleProvider = @Sendable () -> Locale

	/// The name of the table.
	public let name: String

	/// The bundle where the table is located.
	public unowned let bundle: Bundle?

	/// A function that returns the locale of the table.
	/// - Remark: This value is not stored since common values such as ``Locale/current`` may change between calls.
	private let localeProvider: LocaleProvider

	/// Create a reference to a localization table.
	/// - Parameters:
	///   - name: The name of the table.
	///   - bundle: The bundle where the table is located.
	///   - locale: The locale of the table.
	public init(
		_ name: String,
		bundle: Bundle? = nil,
		locale: @autoclosure @escaping LocaleProvider = .current
	) {
		self.name = name
		self.bundle = bundle
		localeProvider = locale
	}
}

// MARK: - Sendable

extension LocalizationTable: Sendable { }

// MARK: - Equatable

extension LocalizationTable: Equatable {
	public static func == (lhs: Self, rhs: Self) -> Bool {
		lhs.name == rhs.name
			&& lhs.bundle == rhs.bundle
			&& lhs.locale == rhs.locale
	}
}

// MARK: - ExpressibleByStringLiteral

extension LocalizationTable: ExpressibleByStringLiteral {
	public init(stringLiteral value: StringLiteralType) {
		self.init(value)
	}
}

// MARK: - Properties

public extension LocalizationTable {
	/// The locale of the table.
	var locale: Locale {
		localeProvider()
	}
}
