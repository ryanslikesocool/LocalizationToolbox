#if canImport(SwiftUI)
import SwiftUI

public extension TextField where
	Label == Text
{
	/// Creates a text field that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - text: The text to display and edit.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		text: Binding<String>
	) {
		self.init(String(localized: titleResource), text: text)
	}

	/// Creates a text field that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - text: The text to display and edit.
	///   - prompt: A `Text` view representing the prompt of the text field which provides users with guidance on what to type into the text field.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		text: Binding<String>,
		prompt: Text?
	) {
		self.init(String(localized: titleResource), text: text, prompt: prompt)
	}

	/// Creates a text field with a preferred axis that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Specify a preferred axis in which the text field should scroll its content when it does not fit in the available space.
	/// Depending on the style of the field, this axis may not be respected.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - text: The text to display and edit.
	///   - axis: The axis in which to scroll text when it doesn’t fit in the available space.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		text: Binding<String>,
		axis: Axis
	) {
		self.init(String(localized: titleResource), text: text, axis: axis)
	}

	/// Creates a text field with a preferred axis that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Specify a preferred axis in which the text field should scroll its content when it does not fit in the available space.
	/// Depending on the style of the field, this axis may not be respected.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - text: The text to display and edit.
	///   - prompt: A `Text` view representing the prompt of the text field which provides users with guidance on what to type into the text field.
	///   - axis: The axis in which to scroll text when it doesn’t fit in the available space.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		text: Binding<String>,
		prompt: Text?,
		axis: Axis
	) {
		self.init(String(localized: titleResource), text: text, prompt: prompt, axis: axis)
	}

	/// Creates a text field that applies a format style to a bound value that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use this initializer to create a text field that binds to a bound value, using a
	/// [`ParseableFormatStyle`]( https://developer.apple.com/documentation/foundation/parseableformatstyle )
	/// to convert to and from this type.
	/// Changes to the bound value update the string displayed by the text field.
	/// Editing the text field updates the bound value, as long as the format style can parse the text.
	/// If the format style can’t parse the input, the bound value remains unchanged.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - value: The underlying value to edit.
	///   - format: A format style of type `F` to use when converting between the string the user edits and the underlying value of type `F.FormatInput`.
	///   If format can’t perform the conversion, the text field leaves `binding.value` unchanged.
	///   If the user stops editing the text in an invalid state, the text field updates the field’s text to the last known valid value.
	///   - prompt: A `Text` view representing the prompt of the text field which provides users with guidance on what to type into the text field.
	///   Defaults to `nil`.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<F>(
		_ titleResource: LocalizedStringResource,
		value: Binding<F.FormatInput>,
		format: F,
		prompt: Text? = nil
	) where
		F: ParseableFormatStyle,
		F.FormatOutput == String
	{
		self.init(String(localized: titleResource), value: value, format: format, prompt: prompt)
	}

	/// Create an instance which binds over an arbitrary value that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use this initializer to create a text field that binds to a bound optional value, using a
	/// [`Formatter`]( https://developer.apple.com/documentation/foundation/formatter )
	/// to convert to and from this type.
	/// Changes to the bound value update the string displayed by the text field.
	/// Editing the text field updates the bound value, as long as the formatter can parse the text.
	/// If the format style can’t parse the input, the bound value remains unchanged.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - value: The underlying value to edit.
	///   - formatter: A formatter to use when converting between the string the user edits and the underlying value of type `V`.
	///   If `formatter` can’t perform the conversion, the text field doesn’t modify `binding.value`.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<V>(
		_ titleResource: LocalizedStringResource,
		value: Binding<V>,
		formatter: Formatter
	) {
		self.init(String(localized: titleResource), value: value, formatter: formatter)
	}

	/// Create an instance which binds over an arbitrary value that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use this initializer to create a text field that binds to a bound optional value, using a
	/// [`Formatter`]( https://developer.apple.com/documentation/foundation/formatter )
	/// to convert to and from this type.
	/// Changes to the bound value update the string displayed by the text field.
	/// Editing the text field updates the bound value, as long as the formatter can parse the text.
	/// If the format style can’t parse the input, the bound value remains unchanged.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - value: The underlying value to edit.
	///   - formatter: A formatter to use when converting between the string the user edits and the underlying value of type `V`.
	///   If `formatter` can’t perform the conversion, the text field doesn’t modify `binding.value`.
	///   - prompt: A `Text` view representing the prompt of the text field which provides users with guidance on what to type into the text field.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<V>(
		_ titleResource: LocalizedStringResource,
		value: Binding<V>,
		formatter: Formatter,
		prompt: Text?
	) {
		self.init(String(localized: titleResource), value: value, formatter: formatter, prompt: prompt)
	}

	/// Creates a text field with a binding to the current selection that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// Use the
	/// [`onSubmit(of:_:)`]( https://developer.apple.com/documentation/swiftui/view/onsubmit(of:_:) )
	/// modifier to invoke an action whenever the user submits this text field.
	/// 
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the text field.
	///   - text: The text to display and edit.
	///   - selection: A
	///   [`Binding`]( https://developer.apple.com/documentation/swiftui/binding )
	///   to the variable containing the selection.
	///   - prompt: A `Text` view representing the prompt of the text field which provides users with guidance on what to type into the text field.
	///   Defaults to `nil`.
	///   - axis: The axis in which to scroll text when it doesn’t fit in the available space.
	///   Defaults to `nil`.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, visionOS 2, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		text: Binding<String>,
		selection: Binding<TextSelection?>,
		prompt: Text? = nil,
		axis: Axis? = nil
	) {
		self.init(String(localized: titleResource), text: text, selection: selection, prompt: prompt, axis: axis)
	}
}
#endif
