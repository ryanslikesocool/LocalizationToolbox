#if canImport(SwiftUI)
import SwiftUI

// MARK: - where Label == Text

public extension Picker where
	Label == Text
{
	/// Creates a picker that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), selection: selection, content: content)
	}

	/// Creates a picker bound to a collection of bindings that generates its label from a string resource.
	///
	/// If the wrapped values of the collection passed to sources are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content
	) where C: RandomAccessCollection {
		self.init(String(localized: titleResource), sources: sources, selection: selection, content: content)
	}

	// MARK: currentValueLabel

	/// Creates a picker that generates its label from a string resource and accepts a custom current value label.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) {
		self.init(String(localized: titleResource), selection: selection, content: content, currentValueLabel: currentValueLabel)
	}

	/// Creates a picker bound to a collection of bindings that generates its label from a string resource and accepts a custom current value label.
	///
	/// If the wrapped values of the collection passed to sources are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) where C: RandomAccessCollection {
		self.init(String(localized: titleResource), sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
	}
}

// MARK: - where Label == SwiftUI.Label<Text, Image>

public extension Picker where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a picker that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - image: The image resource to lookup.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), image: image, selection: selection, content: content)
	}

	/// Creates a picker that generates its label from a string resource and image resource.
	///
	/// If the wrapped values of the collection passed to `sources` are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - image: The image resource to lookup.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content
	) where
		C: RandomAccessCollection,
		C.Element == Binding<SelectionValue>
	{
		self.init(String(localized: titleResource), image: image, sources: sources, selection: selection, content: content)
	}

	/// Creates a picker that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - systemImage: The name of the image resource to lookup.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), systemImage: systemImage, selection: selection, content: content)
	}

	/// Creates a picker that generates its label from a string resource and system image.
	///
	/// If the wrapped values of the collection passed to `sources` are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - systemImage: The name of the image resource to lookup.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content
	) where
		C: RandomAccessCollection,
		C.Element == Binding<SelectionValue>
	{
		self.init(String(localized: titleResource), systemImage: systemImage, sources: sources, selection: selection, content: content)
	}

	// MARK: currentValueLabel

	/// Creates a picker that generates its label from a string resource and image resource and accepts a custom current value label.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - image: The image resource to lookup.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) {
		self.init(String(localized: titleResource), image: image, selection: selection, content: content, currentValueLabel: currentValueLabel)
	}

	/// Creates a picker that generates its label from a string resource and image resource and accepts a custom current value label.
	///
	/// If the wrapped values of the collection passed to `sources` are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - image: The image resource to lookup.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) where
		C: RandomAccessCollection,
		C.Element == Binding<SelectionValue>
	{
		self.init(String(localized: titleResource), image: image, sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
	}

	/// Creates a picker that generates its label from a string resource and system image and accepts a custom current value label.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - systemImage: The name of the image resource to lookup.
	///   - selection: A binding to a property that determines the currently-selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		selection: Binding<SelectionValue>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) {
		self.init(String(localized: titleResource), systemImage: systemImage, selection: selection, content: content, currentValueLabel: currentValueLabel)
	}

	/// Creates a picker that generates its label from a string resource and system image and accepts a custom current value label.
	///
	/// If the wrapped values of the collection passed to `sources` are not all the same, some styles render the selection in a mixed state.
	/// The specific presentation depends on the style.
	/// For example, a Picker with a menu style uses dashes instead of checkmarks to indicate the selected values.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of selecting an option.
	///   - systemImage: The name of the image resource to lookup.
	///   - sources: A collection of values used as the source for displaying the Picker’s selection.
	///   - selection: The key path of the values that determines the currently-selected options.
	///   When a user selects an option from the picker, the values at the key path of all items in the `sources` collection are updated with the selected option.
	///   - content: A view that contains the set of options.
	///   - currentValueLabel: A view that represents the current value of the picker.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 18, macCatalyst 18, macOS 15, tvOS 18, visionOS 2, watchOS 11, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		sources: C,
		selection: KeyPath<C.Element, Binding<SelectionValue>>,
		@ViewBuilder content: () -> Content,
		@ViewBuilder currentValueLabel: () -> some View
	) where
		C: RandomAccessCollection,
		C.Element == Binding<SelectionValue>
	{
		self.init(String(localized: titleResource), systemImage: systemImage, sources: sources, selection: selection, content: content, currentValueLabel: currentValueLabel)
	}
}
#endif
