import Foundation

/// A reference to a localization table, accessible from another process.
public struct LocalizationTableResource {
	public typealias BundleDescription = LocalizedStringResource.BundleDescription

	/// The name of the table containing the key-value pairs.
	public let name: String?

	/// The bundle containing the table’s strings file.
	public let bundle: BundleDescription

	/// The locale to use to look up a localized string.
	///
	/// This value is ``LocaleDescription/resolved()`` into a [`Locale`](https://developer.apple.com/documentation/foundation/locale) when passed into initializers.
	public var locale: LocaleDescription

	/// Create a reference to a localization table.
	/// - Parameters:
	///   - name: The name of the table containing the key-value pairs.
	///   If `nil` or an empty string, this value defaults to `Localizable.strings`.
	///   - bundle: A [`LocalizedStringResource.BundleDescription`](https://developer.apple.com/documentation/foundation/localizedstringresource/bundledescription) that indicates where to locate the table’s strings file.
	///   By default, the resource uses the main bundle.
	///   - locale: The locale to use to look up a localized string.
	///   By default, the resource uses ``LocaleDescription/current``.
	public init(
		_ name: String?,
		bundle: BundleDescription = .main,
		locale: LocaleDescription = .current
	) {
		self.name = name
		self.bundle = bundle
		self.locale = locale
	}
}

// MARK: - Sendable

extension LocalizationTableResource: Sendable { }

// MARK: - Equatable

extension LocalizationTableResource: Equatable { }

// MARK: - Codable

extension LocalizationTableResource: Codable { }

// MARK: - Convenience

public extension LocalizationTableResource {
	/// Create a reference to the given string resource's localization table.
	/// - Parameter stringResource: The string resource to extract values from.
	init(from stringResource: LocalizedStringResource) {
		self.init(
			stringResource.table,
			bundle: stringResource.bundle,
			locale: LocaleDescription(stringResource.locale)
		)
	}
}