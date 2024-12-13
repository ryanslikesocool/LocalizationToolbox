import Foundation

public extension AttributedString {
	/// Creates an attributed string by looking up a localized string.
	/// - Parameters:
	///   - key: The key for a string in the table that table identifies.
	///   - options: Options that affect the handling of attributes.
	///   - table: The string table to search.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: key, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}

	/// Creates an attributed string by looking up a localized string, including an attribute scope that a key path identifies.
	/// - Parameters:
	///   - key: The key for a string in the table that table identifies.
	///   - options: Options that affect the handling of attributes.
	///   - table: The string table to search.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	///   - scope: An [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) key path that identifies an attribute scope to associate with the attributed string.
	init<S>(
		localized key: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: LocalizationTableResource,
		comment: StaticString? = nil,
		including scope: KeyPath<AttributeScopes, S.Type>
	) where S: AttributeScope {
		self.init(localized: key, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment, including: scope)
	}

	/// Creates an attributed string by looking up a localized string, using a default value if necessary.
	/// - Parameters:
	///   - key: The key for a string in the table that table identifies.
	///   - defaultValue: The localized string for the development locale. For other locales, the string uses this value if a localized string for key isn’t found in the table.
	///   - options: Options that affect the handling of attributes.
	///   - table: The string table to search.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment)
	}

	/// Creates an attributed string by looking up a localized string, including an attribute scope that a key path identifies, using a default value if necessary.
	/// - Parameters:
	///   - key: The key for a string in the table that table identifies.
	///   - defaultValue: The localized string for the development locale. For other locales, the string uses this value if a localized string for key isn’t found in the table.
	///   - options: Options that affect the handling of attributes.
	///   - table: The string table to search.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	///   - scope: An [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) key path that identifies an attribute scope to associate with the attributed string.
	init<S>(
		localized key: StaticString,
		defaultValue: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: LocalizationTableResource,
		comment: StaticString? = nil,
		including scope: KeyPath<AttributeScopes, S.Type>
	) where S: AttributeScope {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle.resolved(), locale: table.locale, comment: comment, including: scope)
	}
}
