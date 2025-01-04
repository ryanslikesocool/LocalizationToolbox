/// A protocol defining generic initializers for localization option objects, such as
/// [`String.LocalizationOptions`]( https://developer.apple.com/documentation/swift/string/localizationoptions )
/// and
/// [`AttributedString.LocalizationOptions`]( https://developer.apple.com/documentation/foundation/attributedstring/localizationoptions ).
public protocol LocalizationOptions {
	/// Create new localization options.
	///
	/// - Parameter replacements: An array of replacement options.
	init(replacements: [any CVarArg])
}

// MARK: - Intrinsic

public extension LocalizationOptions {
	/// Create new localization options.
	///
	/// - Parameter replacements: A sequence of replacement options.
	init<S>(replacements: S) where
		S: Sequence,
		S.Element == any CVarArg
	{
		self.init(replacements: Array(replacements))
	}

	/// Create new localization options.
	///
	/// - Parameter replacements: A sequence of replacement options.
	init<S>(replacements: S) where
		S: Sequence,
		S.Element: CVarArg
	{
		self.init(replacements: Array(replacements) as [any CVarArg])
	}

	/// Create new localization options.
	///
	/// - Parameter replacements: Replacement options.
	@_disfavoredOverload
	init(replacements: any CVarArg...) {
		self.init(replacements: replacements)
	}
}
