import Foundation

public extension AttributedString {
	// MARK: - BundleResolvable, LocaleResolvable

	/// Creates an attributed string by looking up a localized string from the app’s bundle.
	///
	/// To create localizable attributed strings, use Markdown syntax in your strings files. The following example shows a string from a Spanish localization:
	/// ```
	/// "_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";
	/// ```
	/// You load this string with one of the initializers that takes `localized` as its first parameter, like the following:
	/// ```swift
	/// let visitString = AttributedString(localized: "_Please visit our [website](https://www.example.com)._")
	/// ```
	/// The resulting attributed string contains an
	/// [`inlinePresentationIntent`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796123-inlinepresentationintent) attribute to apply the
	/// [`emphasized`](https://developer.apple.com/documentation/foundation/inlinepresentationintent/3746895-emphasized) presentation intent over the entire string. It also applies the
	/// [`link`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3764633-link)
	/// attribute to the text `sitio` web. User interface frameworks like SwiftUI and UIKit can then use these attributes when presenting the text to the user.
	///
	/// ## Applying Automatic Grammar Agreement
	/// To apply the automatic grammar agreement feature when loading a localized string, use Apple’s Markdown extension syntax: `^[text to inflect](inflect: true)`. The following example shows a format string with a Spanish localization for a food-ordering app.
	/// ```
	/// "Add ^[%lld %@ %@](inflect: true) to your order" = "Añadir ^[%1$lld %3$@ %2$@](inflect: true) a tu pedido";
	/// ```
	/// You load and localize this string as follows:
	/// ```swift
	/// let orderString = AttributedString(
	/// 	localized: "Add ^[\(quantity) \(foodSizeSelection.localizedName) \(food.localizedName)](inflect: true) to your order")
	/// // "Añadir 2 ensaladas grandes a tu pedido."
	/// ```
	/// When the string loads, the automatic grammar agreement feature adjusts the text for `foodSizeSelection` and `food` to match the number and gender of the sentence.
	///
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
	///   - options: Options that affect the handling of attributes.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table in `Localizable.strings`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale of the localized string to retrieve. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: key, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale(), comment: comment)
	}

	/// Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope that a key path identifies.
	///
	/// To create localizable attributed strings, use Markdown syntax in your strings files. The following example shows a string from a Spanish localization:
	/// ```
	/// "_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";
	/// ```
	/// You load this string with one of the initializers that takes `localized` as its first parameter, like the following:
	/// ```swift
	/// let visitString = AttributedString(localized: "_Please visit our [website](https://www.example.com)._")
	/// ```
	/// The resulting attributed string contains an
	/// [`inlinePresentationIntent`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796123-inlinepresentationintent) attribute to apply the
	/// [`emphasized`](https://developer.apple.com/documentation/foundation/inlinepresentationintent/3746895-emphasized) presentation intent over the entire string. It also applies the
	/// [`link`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3764633-link)
	/// attribute to the text `sitio` web. User interface frameworks like SwiftUI and UIKit can then use these attributes when presenting the text to the user.
	///
	/// ## Applying Automatic Grammar Agreement
	/// To apply the automatic grammar agreement feature when loading a localized string, use Apple’s Markdown extension syntax: `^[text to inflect](inflect: true)`. The following example shows a format string with a Spanish localization for a food-ordering app.
	/// ```
	/// "Add ^[%lld %@ %@](inflect: true) to your order" = "Añadir ^[%1$lld %3$@ %2$@](inflect: true) a tu pedido";
	/// ```
	/// You load and localize this string as follows:
	/// ```swift
	/// let orderString = AttributedString(
	/// 	localized: "Add ^[\(quantity) \(foodSizeSelection.localizedName) \(food.localizedName)](inflect: true) to your order")
	/// // "Añadir 2 ensaladas grandes a tu pedido."
	/// ```
	/// When the string loads, the automatic grammar agreement feature adjusts the text for `foodSizeSelection` and `food` to match the number and gender of the sentence.
	///
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
	///   - options: Options that affect the handling of attributes.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table in `Localizable.strings`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale of the localized string to retrieve. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	///   - scope: An [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) key path that identifies an attribute scope to associate with the attributed string.
	init<S>(
		localized key: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil,
		including scope: KeyPath<AttributeScopes, S.Type>
	) where S: AttributeScope {
		self.init(localized: key, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale(), comment: comment, including: scope)
	}

	/// Creates an attributed string by looking up a localized string from the app’s bundle, using a default value if necessary.
	///
	/// Use this initializer instead of ``init(localized:options:table:bundle:locale:comment:)`` if you prefer to use a symbolic string key, rather than use the development language’s string as the key.
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
	///   - defaultValue: The localized string for the development locale. For other locales, the string uses this value if a localized string for `key` isn’t found in the table.
	///   - options: Options that affect the handling of attributes.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table in `Localizable.strings`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale of the localized string to retrieve. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale(), comment: comment)
	}

	/// Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope that a key path identifies, using a default value if necessary.
	///
	/// Use this initializer instead of ``init(localized:options:table:bundle:locale:comment:including:)`` if you prefer to use a symbolic string key, rather than use the development language’s string as the key.
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
	///   - defaultValue: The localized string for the development locale. For other locales, the string uses this value if a localized string for `key` isn’t found in the table.
	///   - options: Options that affect the handling of attributes.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table in `Localizable.strings`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale of the localized string to retrieve. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	///   - scope: An [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) key path that identifies an attribute scope to associate with the attributed string.
	init<S>(
		localized key: StaticString,
		defaultValue: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil,
		including scope: KeyPath<AttributeScopes, S.Type>
	) where S: AttributeScope {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale(), comment: comment, including: scope)
	}

	// MARK: - LocalizationTableResource

	/// Creates an attributed string by looking up a localized string.
	///
	/// To create localizable attributed strings, use Markdown syntax in your strings files. The following example shows a string from a Spanish localization:
	/// ```
	/// "_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";
	/// ```
	/// You load this string with one of the initializers that takes `localized` as its first parameter, like the following:
	/// ```swift
	/// let visitString = AttributedString(localized: "_Please visit our [website](https://www.example.com)._")
	/// ```
	/// The resulting attributed string contains an
	/// [`inlinePresentationIntent`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796123-inlinepresentationintent) attribute to apply the
	/// [`emphasized`](https://developer.apple.com/documentation/foundation/inlinepresentationintent/3746895-emphasized) presentation intent over the entire string. It also applies the
	/// [`link`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3764633-link)
	/// attribute to the text `sitio` web. User interface frameworks like SwiftUI and UIKit can then use these attributes when presenting the text to the user.
	///
	/// ## Applying Automatic Grammar Agreement
	/// To apply the automatic grammar agreement feature when loading a localized string, use Apple’s Markdown extension syntax: `^[text to inflect](inflect: true)`. The following example shows a format string with a Spanish localization for a food-ordering app.
	/// ```
	/// "Add ^[%lld %@ %@](inflect: true) to your order" = "Añadir ^[%1$lld %3$@ %2$@](inflect: true) a tu pedido";
	/// ```
	/// You load and localize this string as follows:
	/// ```swift
	/// let orderString = AttributedString(
	/// 	localized: "Add ^[\(quantity) \(foodSizeSelection.localizedName) \(food.localizedName)](inflect: true) to your order")
	/// // "Añadir 2 ensaladas grandes a tu pedido."
	/// ```
	/// When the string loads, the automatic grammar agreement feature adjusts the text for `foodSizeSelection` and `food` to match the number and gender of the sentence.
	///
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
	///   - options: Options that affect the handling of attributes.
	///   - table: The string table to search.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: String.LocalizationValue,
		options: AttributedString.FormattingOptions = [],
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: key, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	/// Creates an attributed string by looking up a localized string, including an attribute scope that a key path identifies.
	///
	/// To create localizable attributed strings, use Markdown syntax in your strings files. The following example shows a string from a Spanish localization:
	/// ```
	/// "_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";
	/// ```
	/// You load this string with one of the initializers that takes `localized` as its first parameter, like the following:
	/// ```swift
	/// let visitString = AttributedString(localized: "_Please visit our [website](https://www.example.com)._")
	/// ```
	/// The resulting attributed string contains an
	/// [`inlinePresentationIntent`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796123-inlinepresentationintent) attribute to apply the
	/// [`emphasized`](https://developer.apple.com/documentation/foundation/inlinepresentationintent/3746895-emphasized) presentation intent over the entire string. It also applies the
	/// [`link`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3764633-link)
	/// attribute to the text `sitio` web. User interface frameworks like SwiftUI and UIKit can then use these attributes when presenting the text to the user.
	///
	/// ## Applying Automatic Grammar Agreement
	/// To apply the automatic grammar agreement feature when loading a localized string, use Apple’s Markdown extension syntax: `^[text to inflect](inflect: true)`. The following example shows a format string with a Spanish localization for a food-ordering app.
	/// ```
	/// "Add ^[%lld %@ %@](inflect: true) to your order" = "Añadir ^[%1$lld %3$@ %2$@](inflect: true) a tu pedido";
	/// ```
	/// You load and localize this string as follows:
	/// ```swift
	/// let orderString = AttributedString(
	/// 	localized: "Add ^[\(quantity) \(foodSizeSelection.localizedName) \(food.localizedName)](inflect: true) to your order")
	/// // "Añadir 2 ensaladas grandes a tu pedido."
	/// ```
	/// When the string loads, the automatic grammar agreement feature adjusts the text for `foodSizeSelection` and `food` to match the number and gender of the sentence.
	///
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
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
		self.init(localized: key, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment, including: scope)
	}

	/// Creates an attributed string by looking up a localized string, using a default value if necessary.
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
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
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	/// Creates an attributed string by looking up a localized string, including an attribute scope that a key path identifies, using a default value if necessary.
	///
	/// Use this initializer instead of ``init(localized:options:table:comment:including:)`` if you prefer to use a symbolic string key, rather than use the development language’s string as the key.
	/// - Parameters:
	///   - key: The key for a string in the table that `table` identifies.
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
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment, including: scope)
	}
}
