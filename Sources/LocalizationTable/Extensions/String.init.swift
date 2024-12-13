import Foundation

public extension String {
	/// Creates a localized string from an interpolated string.
	/// - Parameters:
	///   - keyAndValue: The key for an entry in the specified table.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized keyAndValue: LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key.
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A localization value to use if `key` doesn’t exist in `table`. Xcode’s Product > Export Localizations feature also extracts this value as the default translation in the project’s development locale.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an interpolated string, applying the specified options.
	/// - Parameters:
	///   - keyAndValue: The key for an entry in the specified table.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized keyAndValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key, applying the specified options.
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A localization value to use if `key` doesn’t exist in `table`. Xcode’s Product > Export Localizations feature also extracts this value as the default translation in the project’s development locale.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		options: LocalizationOptions,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}
}
