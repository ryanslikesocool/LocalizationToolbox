#if canImport(SwiftUI)
import SwiftUI

public extension LabeledContent where
	Label == Text,
	Content: View
{
	/// Creates a labeled view that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the view.
	///   - content: The value content being labeled.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), content: content)
	}
}

public extension LabeledContent where
	Label == Text,
	Content == Text
{
	/// Creates a labeled informational view that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the view.
	///   - value: The value being labeled.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<S>(
		_ titleResource: LocalizedStringResource,
		value: S
	) where
		S: StringProtocol
	{
		self.init(String(localized: titleResource), value: value)
	}

	/// Creates a labeled informational view from a formatted value that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the view.
	///   - value: The value being labeled.
	///   - format: A format style of type `F` to convert the underlying value of type `F.FormatInput` to a string representation.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<F>(
		_ titleResource: LocalizedStringResource,
		value: F.FormatInput,
		format: F
	) where
		F: FormatStyle,
		F.FormatInput: Equatable,
		F.FormatOutput == String
	{
		self.init(String(localized: titleResource), value: value, format: format)
	}
}
#endif
