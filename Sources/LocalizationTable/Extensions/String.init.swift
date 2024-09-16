import Foundation

public extension String {
	@inlinable @inline(__always)
	init(
		localized keyAndValue: LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		let resource = LocalizedStringResource(keyAndValue, table: table, comment: comment)
		self.init(localized: resource)
	}

	@inlinable @inline(__always)
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		let resource = LocalizedStringResource(key, defaultValue: defaultValue, table: table, comment: comment)
		self.init(localized: resource)
	}

	@inlinable @inline(__always)
	init(
		localized keyAndValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		let resource = LocalizedStringResource(keyAndValue, table: table, comment: comment)
		self.init(localized: resource, options: options)
	}

	@inlinable @inline(__always)
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		let resource = LocalizedStringResource(key, defaultValue: defaultValue, table: table, comment: comment)
		self.init(localized: resource, options: options)
	}
}
