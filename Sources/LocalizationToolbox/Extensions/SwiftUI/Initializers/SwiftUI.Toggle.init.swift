#if canImport(SwiftUI)
import SwiftUI
#if canImport(AppIntents)
import AppIntents
#endif

// MARK: - init (Text)

public extension Toggle where
	Label == Text
{
	/// Creates a toggle that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: titleResource), isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where
		C: RandomAccessCollection
	{
		self.init(String(localized: titleResource), sources: sources, isOn: isOn)
	}

	// MARK: AppIntents

#if canImport(AppIntents)
	/// Creates a toggle that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - isOn: Whether the toggle is on or off.
	///   - intent: The `AppIntent` to be performed.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		isOn: Bool,
		intent: some AppIntent
	) {
		self.init(String(localized: titleResource), isOn: isOn, intent: intent)
	}
#endif
}

// MARK: - init (Label)

public extension Toggle where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a toggle that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - image: The image resource to lookup.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: titleResource), image: image, isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - image: The image resource to lookup.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where C: RandomAccessCollection {
		self.init(String(localized: titleResource), image: image, sources: sources, isOn: isOn)
	}

	/// Creates a toggle that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - systemImage: The name of the image resource to lookup.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: titleResource), systemImage: systemImage, isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the toggle.
	///   - systemImage: The name of the image resource to lookup.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where C: RandomAccessCollection {
		self.init(String(localized: titleResource), systemImage: systemImage, sources: sources, isOn: isOn)
	}
}
#endif
