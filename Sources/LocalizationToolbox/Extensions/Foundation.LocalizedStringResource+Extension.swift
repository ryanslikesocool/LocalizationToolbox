import Foundation

public extension LocalizedStringResource {
	/// Create a copy of this resource with the given `locale`.
	/// 
	/// - Parameter locale: The locale of the new resource.
	/// - Returns: A copy of the resource with the given `locale`.
	func with(locale: some LocaleResolvable) -> Self {
		var copy = self
		copy.locale = locale.resolveLocale()
		return copy
	}
}
