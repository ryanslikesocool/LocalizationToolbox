import Foundation

/// A wrapper around
/// [`Locale`]( https://developer.apple.com/documentation/foundation/locale )
/// that preserves information about computed properties.
///
/// The dynamic nature of properties such as
/// [`Locale.current`]( https://developer.apple.com/documentation/foundation/locale/2293654-current )
/// and
/// [`Locale.autoupdatingCurrent`]( https://developer.apple.com/documentation/foundation/locale/2293741-autoupdatingcurrent )
/// cannot be preserved by default, since they are computed when read.
public enum LocaleDescription {
	/// A fixed
	/// [`Locale`]( https://developer.apple.com/documentation/foundation/locale )
	/// value.
	///
	/// When ``resolveLocale()`` is called, the case argument is returned.
	case fixed(Locale)

	/// The user's current locale.
	///
	/// When ``resolveLocale()`` is called,
	/// [`Locale.current`]( https://developer.apple.com/documentation/foundation/locale/2293654-current )
	/// is returned.
	case current

	/// A locale which tracks the user’s current preferences.
	///
	/// When ``resolveLocale()`` is called,
	/// [`Locale.autoupdatingCurrent`]( https://developer.apple.com/documentation/foundation/locale/2293741-autoupdatingcurrent )
	/// is returned.
	case autoupdatingCurrent
}

// MARK: - Sendable

extension LocaleDescription: Sendable { }

// MARK: - Equatable

extension LocaleDescription: Equatable { }

// MARK: - Hashable

extension LocaleDescription: Hashable { }

// MARK: - Codable

extension LocaleDescription: Codable {
	private enum CodingValue: String, Codable {
		case current
		case autoupdatingCurrent
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()

		self = if let codingValue = try? container.decode(CodingValue.self) {
			switch codingValue {
				case .current: .current
				case .autoupdatingCurrent: .autoupdatingCurrent
			}
		} else {
			try .fixed(container.decode(Locale.self))
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()

		let encodingValue: any Encodable = switch self {
			case let .fixed(locale): locale
			case .current: CodingValue.current
			case .autoupdatingCurrent: CodingValue.autoupdatingCurrent
		}

		try container.encode(encodingValue)
	}
}

// MARK: - LocaleResolvable

extension LocaleDescription: LocaleResolvable {
	public func resolveLocale() -> Locale {
		switch self {
			case let .fixed(locale): locale
			case .current: .current
			case .autoupdatingCurrent: .autoupdatingCurrent
		}
	}
}

// MARK: - LocaleDescriptionResolvable

extension LocaleDescription: LocaleDescriptionResolvable {
	public func resolveLocaleDescription() -> LocaleDescription {
		self
	}
}

// MARK: - Convenience

public extension LocaleDescription {
	/// Create a locale description from a
	/// [`Locale`]( https://developer.apple.com/documentation/foundation/locale ).
	///
	/// - Parameter locale:
	init(_ locale: Locale) {
		self = switch locale {
			case .current: .current
			case .autoupdatingCurrent: .autoupdatingCurrent
			case let other: .fixed(other)
		}
	}
}
