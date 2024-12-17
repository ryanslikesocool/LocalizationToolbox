import Foundation

/// Describes an object that can be resolved into a [`Locale`](https://developer.apple.com/documentation/foundation/locale) .
public protocol LocaleResolvable {
	/// Resolve the object into a [`Locale`](https://developer.apple.com/documentation/foundation/locale) .
	func resolveLocale() -> Locale
}
