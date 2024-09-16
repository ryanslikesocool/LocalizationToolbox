import Foundation

public extension LocalizedStringResource {
	/// Creates a localized string resource from a localization key and its bundle properties.
	/// - Parameters:
	///   - keyAndValue: The key for an entry in the specified table.
	///   - table: <#table description#>
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	@inlinable @inline(__always)
	init(
		_ keyAndValue: String.LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(
			keyAndValue,
			table: table.name,
			locale: table.locale,
			bundle: table.bundle,
			comment: comment
		)
	}

	/// Creates a localized string resource from a static string and its bundle properties.
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A localization value to use if `key` doesn’t exist in `table`. Xcode’s Product > Export Localizations feature also extracts this value as the default translation in the project’s development locale.
	///   - table: <#table description#>
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	@inlinable @inline(__always)
	init(
		_ key: StaticString,
		defaultValue: String.LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(
			key,
			defaultValue: defaultValue,
			table: table.name,
			locale: table.locale,
			bundle: table.bundle,
			comment: comment
		)
	}
}
