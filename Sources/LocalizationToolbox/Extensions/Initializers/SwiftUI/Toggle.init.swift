#if canImport(SwiftUI)
import SwiftUI

public extension Toggle where
	Label == Text
{
	/// Creates a toggle that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`](https://developer.apple.com/documentation/swiftui/text)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	nonisolated init(
		_ title: LocalizedStringResource,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: title), isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`](https://developer.apple.com/documentation/swiftui/text)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	nonisolated init<C>(
		_ title: LocalizedStringResource,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where
		C : RandomAccessCollection
	{
		self.init(String(localized: title), sources: sources, isOn: isOn)
	}
}

public extension Toggle where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a toggle that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - image: The image resource to lookup.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	nonisolated init(
		_ title: LocalizedStringResource,
		image: ImageResource,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: title), image: image, isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - image: The image resource to lookup.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	nonisolated init<C>(
		_ title: LocalizedStringResource,
		image: ImageResource,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where C : RandomAccessCollection {
		self.init(String(localized: title), image: image, sources: sources, isOn: isOn)
	}

	/// Creates a toggle that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - systemImage: The name of the image resource to lookup.
	///   - isOn: A binding to a property that indicates whether the toggle is on or off.
	nonisolated init(
		_ title: LocalizedStringResource,
		systemImage: String,
		isOn: Binding<Bool>
	) {
		self.init(String(localized: title), systemImage: systemImage, isOn: isOn)
	}

	/// Creates a toggle representing a collection of values that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the toggle.
	///   - systemImage: The name of the image resource to lookup.
	///   - sources: A collection of values used as the source for rendering the Toggle’s state.
	///   - isOn: The key path of the values that determines whether the toggle is on, mixed or off.
	nonisolated init<C>(
		_ title: LocalizedStringResource,
		systemImage: String,
		sources: C,
		isOn: KeyPath<C.Element, Binding<Bool>>
	) where C : RandomAccessCollection {
		self.init(String(localized: title), systemImage: systemImage, sources: sources, isOn: isOn)
	}
}
#endif
