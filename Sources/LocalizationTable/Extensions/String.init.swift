import Foundation

public extension String {
	// MARK: - BundleResolvable, LocaleResolvable

	/// Creates a localized string from an interpolated string.
	///
	/// Use this initializer when the development-language string serves as your localization key.
	/// You can use a fixed string for the key or a string that the system interpolates from values you provide at runtime.
	/// For example, if your app’s strings catalog contains a localizable entry for “`Hello, %@.`”, you create a localized string like the following:
	/// ```swift
	/// // Assume the strings file or catalog contains "Hello, %@." for English
	/// // and "Bonjour, %@." for French.
	/// let userName = "Juan"
	/// let greeting = String(localized: "Hello, \(userName).")
	/// // greeting == "Hello, Juan." in en locale, "Bonjour, Juan." in fr locale.
	/// ```
	///
	/// If you prefer to use an arbitrary localization key rather than the localized string in the development language, use ``init(localized:defaultValue:table:bundle:locale:comment:)``.
	/// If you need to provide localized strings to another process that might be using a different locale, use [`init(localized:)`](https://developer.apple.com/documentation/swift/string/init(localized:)) .
	///
	/// - Parameters:
	///   - keyAndValue: A [`String.LocalizationValue`](https://developer.apple.com/documentation/swift/string/localizationvalue) that provides the localization key to look up. This parameter also serves as the default value if the system can’t find a localized string.
	///   - table: The bundle’s string table to search. If `table` is `nil` or is an empty string, the method attempts to use the table named `Localizable`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale to use when localizing interpolated values, such as numbers. This doesn’t change which locale the system uses to look up the localized string. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized keyAndValue: LocalizationValue,
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale() ?? .current, comment: comment)
	}

	/// Creates a localized string from an interpolated string, applying the specified options.
	///
	/// Use this initializer when the development-language string serves as your localization key.
	/// You can use a fixed string for the key or a string that the system interpolates from values you provide at runtime.
	/// For example, if your app’s strings catalog contains a localizable entry for `“Hello, %@.`”, you create a localized string like the following:
	/// ```swift
	/// // Assume the strings file or catalog contains "Hello, %@." for English
	/// // and "Bonjour, %@." for French.
	/// let userName = "Juan"
	/// let greeting = String(localized: "Hello, \(userName).")
	/// // greeting == "Hello, Juan." in en locale, "Bonjour, Juan." in fr locale.
	/// ```
	///
	/// Use the options parameter to include any replacement values to insert into the localized formatted string.
	/// The formatted string uses the syntax `\(placeholder: TYPE)` to strongly type replacement values.
	/// The following example shows how to insert strongly typed replacement values into a string:
	/// ```swift
	/// // Assume the strings file or catalog contains "Position in queue: %lld."
	/// // for English and "Position dans la file d’attente: %lld." for French.
	/// var options = String.LocalizationOptions()
	/// options.replacements = [12]
	/// let queueMessage = String (localized: "Position in queue: \(placeholder: .int).",
	/// 						   options: options)
	/// // queueMessage == "Position in queue: 12." in en locale, "Position dans la file d’attente: 12." in fr locale.
	/// ```
	///
	/// If you prefer to use an arbitrary localization key rather than the localized string in the development language, use ``init(localized:defaultValue:options:table:bundle:locale:comment:)``.
	/// If you need to provide localized strings to another process that might be using a different locale, use [`init(localized:options:)`](https://developer.apple.com/documentation/swift/string/init(localized:options:)) .
	///
	/// - Parameters:
	///   - keyAndValue: A localization value instance that provides the localization key to look up. This parameter also serves as the default value if the system can’t find a localized string.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table named `Localizable`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale to use when localizing interpolated values, such as numbers. This doesn’t change which locale the system uses to look up the localized string. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized keyAndValue: LocalizationValue,
		options: LocalizationOptions,
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale() ?? .current, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key.
	///
	/// Use the `defaultValue` initializers when you want to use an explicit *key* to look up localized strings.
	/// This is useful if the localizable string in your development language is ambiguous.
	/// For example *call* in English can be a noun or a verb.
	/// In this case, you might want to use `.strings` file entries like `CALL_NOUN` and `CALL_VERB` to disambiguate the uses for localizers.
	/// You then use this initializer, providing both a key and a default value to use if the system can’t find the key at runtime.
	/// ```swift
	/// // Assume the strings file or catalog contains the following:
	/// // English: CALL_VERB = "Call", CALL_NOUN = "Call"
	/// // French: CALL_VERB = "Appeler", CALL_NOUN = "Appel"
	/// let callVerb = String(localized: "CALL_VERB", defaultValue: "Call")
	/// let callNoun = String(localized: "CALL_NOUN", defaultValue: "Call")
	/// // callVerb == "Call" in en locale, "Appeler" in fr locale.
	/// // callNoun == "Call" in en locale, "Appel" in fr locale.
	/// ```
	///
	/// To use the default localization as the key rather than an explicit key, use ``init(localized:table:bundle:locale:comment:)`` instead.
	/// If you need to provide localized strings to another process that might be using a different locale, use [`init(localized:)`](https://developer.apple.com/documentation/swift/string/init(localized:)) .
	///
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A default value to use if looking up a localized string from the bundle fails. This is typically the localizable string in the development language.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table named `Localizable`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale to use when localizing interpolated values, such as numbers. This doesn’t change which locale the system uses to look up the localized string. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale() ?? .current, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key, applying the specified options.
	///
	/// Use the `defaultValue` initializers when you want to use an explicit *key* to look up localized strings.
	/// This is useful if the localizable string in your development language is ambiguous.
	/// For example *call* in English can be a noun or a verb.
	/// In this case, you might want to use `.strings` file entries like `CALL_NOUN` and `CALL_VERB` to disambiguate the uses for localizers.
	/// You then use this initializer, providing both a key and a default value to use if the system can’t find the key at runtime.
	/// ```swift
	/// // Assume the strings file or catalog contains the following:
	/// // English: CALL_VERB = "Call", CALL_NOUN = "Call"
	/// // French: CALL_VERB = "Appeler", CALL_NOUN = "Appel"
	/// let callVerb = String(localized: "CALL_VERB", defaultValue: "Call")
	/// let callNoun = String(localized: "CALL_NOUN", defaultValue: "Call")
	/// // callVerb == "Call" in en locale, "Appeler" in fr locale.
	/// // callNoun == "Call" in en locale, "Appel" in fr locale.
	/// ```
	///
	/// Use the `options` parameter to include any replacement values to insert into the localized formatted string.
	/// The following example shows how to insert strongly-typed replacement values into a string:
	/// ```swift
	/// // Assume the strings file or catalog contains the explicit key "POSITION_IN_QUEUE",
	/// // with localizations "Position in queue: %lld." for English and
	/// // "Position dans la file d’attente: %lld." for French.
	/// var options = String.LocalizationOptions()
	/// options.replacements = [12]
	/// let localized = String (localized: "POSITION_IN_QUEUE",
	/// 						defaultValue:"Position in queue: \(placeholder: .int).",
	/// 						options: options)
	/// // localized = "Position in queue: 12." in en locale, "Position dans la file d’attente: 12." in fr locale.
	/// ```
	///
	/// To use the default localization as the key rather than an explicit key, use ``init(localized:options:table:bundle:locale:comment:)`` instead.
	/// If you need to provide localized strings to another process that might be using a different locale, use [`init(localized:options:)`](https://developer.apple.com/documentation/swift/string/init(localized:options:)) .
	///
	/// - Parameters:
	///   - key: The key for an entry in the specified table.
	///   - defaultValue: A default value to use if looking up a localized string from the bundle fails. This is typically the localizable string in the development language.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - table: The bundle’s string table to search. If table is `nil` or is an empty string, the method attempts to use the table named `Localizable`. The default is `nil`.
	///   - bundle: The bundle to use for looking up strings. If `nil`, an app searches its main bundle. The default is `nil`.
	///   - locale: The locale to use when localizing interpolated values, such as numbers. This doesn’t change which locale the system uses to look up the localized string. If `nil`, this initializer uses the current locale. The default is `nil`.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized key: StaticString,
		defaultValue: LocalizationValue,
		options: LocalizationOptions,
		table: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		locale: (some LocaleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table, bundle: bundle?.resolveBundle(), locale: locale?.resolveLocale() ?? .current, comment: comment)
	}

	// MARK: - LocalizationTableResource

	/// Creates a localized string from an interpolated string.
	///
	/// If you prefer to use an arbitrary localization key rather than the localized string in the development language, use ``init(localized:defaultValue:table:comment:)``.
	///
	/// - Parameters:
	///   - keyAndValue: A [`String.LocalizationValue`](https://developer.apple.com/documentation/swift/string/localizationvalue) that provides the localization key to look up. This parameter also serves as the default value if the system can’t find a localized string.
	///   - table: The table resource containing the key-value pairs.
	///   - comment: The comment to place above the key-value pair in the strings file. This parameter provides the translator with some context about the localized string’s presentation to the user.
	init(
		localized keyAndValue: LocalizationValue,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(localized: keyAndValue, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an interpolated string, applying the specified options.
	///
	/// If you prefer to use an arbitrary localization key rather than the localized string in the development language, use ``init(localized:defaultValue:options:table:comment:)``.
	///
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
		self.init(localized: keyAndValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key.
	///
	/// To use the default localization as the key rather than an explicit key, use ``init(localized:table:comment:)`` instead.
	///
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
		self.init(localized: key, defaultValue: defaultValue, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}

	/// Creates a localized string from an arbitrary static string key, applying the specified options.
	///
	/// To use the default localization as the key rather than an explicit key, use ``init(localized:options:table:comment:)`` instead.
	///
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
		self.init(localized: key, defaultValue: defaultValue, options: options, table: table.name, bundle: table.bundle, locale: table.locale, comment: comment)
	}
}
