import Foundation

// MARK: - LocaleDescriptionResolvable

extension Locale: LocaleDescriptionResolvable {
	public func resolveLocaleDescription() -> LocaleDescription {
		LocaleDescription(self)
	}
}

// MARK: - LocaleResolvable

extension Locale: LocaleResolvable {
	public func resolveLocale() -> Locale {
		self
	}
}
