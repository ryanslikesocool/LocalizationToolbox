#if canImport(SwiftUI)
import SwiftUI

public extension Button where
	Label == Text
{
	/// Creates a button that generates its label from a string.
	///
	/// This initializer creates a
	/// [`Text`](https://developer.apple.com/documentation/swiftui/text)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the button’s `action`.
	///   - action: The action to perform when the user triggers the button.
	nonisolated init(
		_ title: LocalizedStringResource,
		action: @escaping @MainActor () -> Void
	) {
		self.init(String(localized: title), action: action)
	}
}

public extension Button where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a button that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the button’s `action`.
	///   - image: The image resource to lookup.
	///   - action: The action to perform when the user triggers the button.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	nonisolated init(
		_ title: LocalizedStringResource,
		image: ImageResource,
		action: @escaping @MainActor () -> Void
	) {
		self.init(String(localized: title), image: image, action: action)
	}

	/// Creates a button that generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`](https://developer.apple.com/documentation/swiftui/label)
	/// view on your behalf.
	///
	/// - Parameters:
	///   - title: A string resource that describes the purpose of the button’s `action`.
	///   - systemImage: The name of the image resource to lookup.
	///   - action: The action to perform when the user triggers the button.
	nonisolated init(
		_ title: LocalizedStringResource,
		systemImage: String,
		action: @escaping @MainActor () -> Void
	) {
		self.init(String(localized: title), systemImage: systemImage, action: action)
	}
}

// TODO: Add overloads for the following initializers:
// init(_:role:action:)
// init(_:image:role:action:)
// init(_:systemImage:role:action:)
// init(_:intent:)
// init(_:role:intent:)
// init(_:image:role:intent:)
// init(_:systemImage:role:intent:)

#endif
