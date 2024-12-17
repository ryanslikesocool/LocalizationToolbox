import Foundation

extension Locale: LocaleDescriptionResolvable {
	public func resolveLocaleDescription() -> LocaleDescription {
		LocaleDescription(self)
	}
}