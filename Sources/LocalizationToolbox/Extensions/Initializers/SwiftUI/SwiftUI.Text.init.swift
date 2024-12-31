#if canImport(SwiftUI)
import SwiftUI

public extension Text {
	/// Creates a text view that displays localized content identified by a key.
	///
	/// Use this initializer to look for the key parameter in a localization table and display the associated string value in the initialized text view.
	/// If the initializer can’t find the key in the table, or if no table exists, the text view displays the string representation of the key instead.
	/// ```swift
	/// Text("pencil") // Localizes the key if possible, or displays "pencil" if not.
	/// ```
	/// When you initialize a text view with a string literal, the view triggers this initializer because it assumes you want the string localized, even when you don’t explicitly specify a table, as in the above example.
	/// If you haven’t provided localization for a particular string, you still get reasonable behavior, because the initializer displays the key, which typically contains the unlocalized string.
	///
	/// If you initialize a text view with a string variable rather than a string literal, the view triggers the
	/// [`init(_:)`](https://developer.apple.com/documentation/swiftui/text/init(_:)-9d1g4)
	/// initializer instead, because it assumes that you don’t want localization in that case.
	/// If you do want to localize the value stored in a string variable, you can choose to call the `init(_:tableName:bundle:comment:)` initializer by first creating a
	/// [`LocalizedStringKey`](https://developer.apple.com/documentation/swiftui/localizedstringkey) instance from the string variable:
	/// ```swift
	/// Text(LocalizedStringKey(someString)) // Localizes the contents of `someString`.
	/// ```
	/// If you have a string literal that you don’t want to localize, use the [`init(verbatim:)`](https://developer.apple.com/documentation/swiftui/text/init(verbatim:)) initializer instead.
	///
	/// ## Styling localized strings with markdown
	/// If the localized string or the fallback key contains Markdown, the view displays the text with appropriate styling.
	/// For example, consider an app with the following entry in its Spanish localization file:
	/// ```json
	/// "_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";
	/// ```
	/// You can create a `Text` view with the Markdown-formatted base language version of the string as the localization key, like this:
	/// ```swift
	/// Text("_Please visit our [website](https://www.example.com)._")
	/// ```
	/// When viewed in a Spanish locale, the view uses the Spanish text from the strings file, applying the Markdown styling.
	///
	/// - Important: `Text` doesn’t render all styling possible in Markdown.
	/// It doesn’t support line breaks, soft breaks, or any style of paragraph- or block-based formatting like lists, block quotes, code blocks, or tables.
	/// It also doesn’t support the [`imageURL`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796122-imageurl) attribute.
	/// Parsing with SwiftUI treats any whitespace in the Markdown string as described by the
	/// [`AttributedString.MarkdownParsingOptions.InterpretedSyntax.inlineOnlyPreservingWhitespace`](https://developer.apple.com/documentation/foundation/attributedstring/markdownparsingoptions/interpretedsyntax/inlineonlypreservingwhitespace) parsing option.
	///
	/// - Parameters:
	///   - key: The key for a string in the table identified by `tableName`.
	///   - tableName: The name of the string table to search. If `nil`, use the table in the `Localizable.strings` file.
	///   - bundle: The bundle containing the strings file. If `nil`, use the main bundle.
	///   - comment: Contextual information about this key-value pair.
	init(
		_ key: LocalizedStringKey,
		tableName: String? = nil,
		bundle: (some BundleResolvable)? = nil,
		comment: StaticString? = nil
	) {
		self.init(key, tableName: tableName, bundle: bundle?.resolveBundle(), comment: comment)
	}

	/// Creates a text view that displays localized content identified by a key.
	///
	/// - Important: `Text` doesn’t render all styling possible in Markdown.
	/// It doesn’t support line breaks, soft breaks, or any style of paragraph- or block-based formatting like lists, block quotes, code blocks, or tables.
	/// It also doesn’t support the [`imageURL`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3796122-imageurl) attribute.
	/// Parsing with SwiftUI treats any whitespace in the Markdown string as described by the
	/// [`AttributedString.MarkdownParsingOptions.InterpretedSyntax.inlineOnlyPreservingWhitespace`](https://developer.apple.com/documentation/foundation/attributedstring/markdownparsingoptions/interpretedsyntax/inlineonlypreservingwhitespace) parsing option.
	///
	/// - Parameters:
	///   - key: The key for a string in the table identified by `table`.
	///   - table: The string table to search.
	///   - comment: Contextual information about this key-value pair.
	init(
		_ key: LocalizedStringKey,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(key, tableName: table.name, bundle: table.bundle, comment: comment)
	}

	// MARK: - init(_:options:) +

	/// Creates a text view that displays a string resource with localization options.
	///
	/// Use this initializer to display a localized string that is represented by a
	/// [`LocalizedStringResource`](https://developer.apple.com/documentation/foundation/localizedstringresource)\.
	///
	/// - Parameters:
	///   - resource: A `LocalizedStringResource` that provides the localization key, table, bundle, and locale.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	init(
		_ resource: LocalizedStringResource,
		options: String.LocalizationOptions
	) {
		self.init(String(localized: resource, options: options))
	}

	/// Creates a text view that displays a string resource with localization options.
	///
	/// Creates a text view that displays styled attributed content with localization options.
	///
	/// Use this initializer to display a localized string that is represented by a
	/// [`LocalizedStringResource`](https://developer.apple.com/documentation/foundation/localizedstringresource)\.
	///
	/// - Parameters:
	///   - resource: A `LocalizedStringResource` that provides the localization key, table, bundle, and locale.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	init(
		_ resource: LocalizedStringResource,
		options: AttributedString.LocalizationOptions
	) {
		self.init(AttributedString(localized: resource, options: options))
	}

	/// Creates a text view that displays a string resource with localization options.
	///
	/// Use this initializer to display a localized string that is represented by a
	/// [`LocalizedStringResource`](https://developer.apple.com/documentation/foundation/localizedstringresource)\.
	///
	/// - Parameters:
	///   - resource: A `LocalizedStringResource` that provides the localization key, table, bundle, and locale.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - scope:
	init<S>(
		_ resource: LocalizedStringResource,
		options: AttributedString.LocalizationOptions,
		including scope: KeyPath<AttributeScopes, S.Type>
	) where S: AttributeScope {
		self.init(AttributedString(localized: resource, options: options, including: scope))
	}

	/// Creates a text view that displays a string resource with localization options.
	///
	/// Use this initializer to display a localized string that is represented by a
	/// [`LocalizedStringResource`](https://developer.apple.com/documentation/foundation/localizedstringresource)\.
	///
	/// - Parameters:
	///   - resource: A `LocalizedStringResource` that provides the localization key, table, bundle, and locale.
	///   - options: A localization options instance that specifies localization options to apply, such as replacement values for formatted strings.
	///   - scope:
	init<S>(
		_ resource: LocalizedStringResource,
		options: AttributedString.LocalizationOptions,
		including scope: S.Type
	) where S: AttributeScope {
		self.init(AttributedString(localized: resource, options: options, including: scope))
	}
}
#endif
