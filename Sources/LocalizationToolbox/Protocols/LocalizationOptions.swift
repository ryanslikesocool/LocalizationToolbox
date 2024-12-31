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
		self.init(replacements: Array(replacements))
	}

	/// Create new localization options.
	///
	/// - Parameter replacements: Replacement options.
	init(replacements: any CVarArg...) {
		self.init(replacements: replacements)
	}
}