import Foundation

public extension String {
	@inlinable @inline(__always)
	init(
		localized keyAndValue: LocalizationValue,
		table: LocalizationTable,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	@inlinable @inline(__always)
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		table: LocalizationTable,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
public extension String {
	@inlinable @inline(__always)
	init(
		localized keyAndValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTable,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	@inlinable @inline(__always)
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTable,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}
}
