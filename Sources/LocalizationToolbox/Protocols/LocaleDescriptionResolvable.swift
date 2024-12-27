/// Describes an object that can be resolved into a ``LocaleDescription``.
public protocol LocaleDescriptionResolvable {
	/// Resolve the object into a ``LocaleDescription``.
	func resolveLocaleDescription() -> LocaleDescription
}