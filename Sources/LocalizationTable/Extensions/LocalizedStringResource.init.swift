import Foundation

public extension LocalizedStringResource {
	// MARK: - LocaleResolvable, BundleDescriptionResolvable

	/// Creates a localized string resource from a localization key and its bundle properties.
	/// - Parameters:
	///   - keyAndValue: The key for an entry in the specified table.
	///   - table: The name of the table containing the key-value pairs. If not provided, `nil`, or an empty string, this value defaults to `Localizable.strings`.
	///   - locale: The locale for the resource to use. By default, the resource uses [`current`](https://developer.apple.com/documentation/foundation/locale/2293654-current) .
	///   - bundle: A [`LocalizedStringResource.BundleDescription`](https://developer.apple.com/documentation/foundation/localizedstringresource/bundledescription) that indicates where to locate the table’s strings file. By default, the resource uses the main bundle.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		_ keyAndValue: String.LocalizationValue,
		table: String? = nil,
		locale: (some LocaleResolvable)? = nil,
		bundle: (some BundleDescriptionResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(keyAndValue, table: table, locale: locale?.resolveLocale() ?? .current, bundle: bundle?.resolveBundleDescription() ?? .main, comment: comment)
	}

	/// Creates a localized string resource from a static string and its bundle properties.
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A localization value to use if key doesn’t exist in `table`. Xcode’s Product > Export Localizations feature also extracts this value as the default translation in the project’s development locale.
	///   - table: The name of the table containing the key-value pairs. If not provided, `nil`, or an empty string, this value defaults to `Localizable.strings`.
	///   - locale: The locale for the resource to use. By default, the resource uses [`current`](https://developer.apple.com/documentation/foundation/locale/2293654-current) .
	///   - bundle: A [`LocalizedStringResource.BundleDescription`](https://developer.apple.com/documentation/foundation/localizedstringresource/bundledescription) that indicates where to locate the table’s strings file. By default, the resource uses the main bundle.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		_ key: StaticString,
		defaultValue: String.LocalizationValue,
		table: String? = nil,
		locale: (some LocaleResolvable)? = nil,
		bundle: (some BundleDescriptionResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(key, defaultValue: defaultValue, table: table, locale: locale?.resolveLocale() ?? .current, bundle: bundle?.resolveBundleDescription() ?? .main, comment: comment)
	}

	// MARK: - LocalizationTableResource

	/// Creates a localized string resource from a localization key and its bundle properties.
	/// - Parameters:
	///   - keyAndValue: The key for an entry in the specified table.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		_ keyAndValue: String.LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(keyAndValue, table: table.name, locale: table.locale, bundle: table.bundle, comment: comment)
	}

	/// Creates a localized string resource from a static string and its bundle properties.
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A localization value to use if `key` doesn’t exist in `table`. Xcode’s Product > Export Localizations feature also extracts this value as the default translation in the project’s development locale.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		_ key: StaticString,
		defaultValue: String.LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(key, defaultValue: defaultValue, table: table.name, locale: table.locale, bundle: table.bundle, comment: comment)
	}
}
