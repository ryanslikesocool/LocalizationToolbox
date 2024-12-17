import Foundation

extension Locale: LocaleResolvable {
	public func resolveLocale() -> Locale {
		self
	}
}
