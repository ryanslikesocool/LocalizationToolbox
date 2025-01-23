#if canImport(SwiftUI)
import SwiftUI

// MARK: - where Label == Text

public extension Menu where
	Label == Text
{
	/// Creates a menu that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the menu.
	///   - content: A group of menu items.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), content: content)
	}

	// MARK: primaryAction

	/// Creates a menu with a primary action that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the menu.
	///   - content: A group of menu items.
	///   - primaryAction: The action to perform on primary interaction with the menu.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder content: () -> Content,
		primaryAction: @escaping () -> Void
	) {
		self.init(String(localized: titleResource), content: content, primaryAction: primaryAction)
	}
}

// MARK: - where Label == SwiftUI.Label<Text, Image>

public extension Menu where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a menu that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the menu.
	///   - image: The image resource to lookup.
	///   - content: A group of menu items.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), image: image, content: content)
	}

	/// Creates a menu that generates its label from a string resource and system image.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the menu.
	///   - systemImage: The image resource to lookup.
	///   - content: A group of menu items.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: titleResource), systemImage: systemImage, content: content)
	}

	// MARK: primaryAction

	// NOTE: For some reason, SwiftUI doesn't have a matching initializer that accepts `StringProtocol`.
//	/// Creates a menu with a primary action that generates its label from a string resource and image resource.
//	///
//	/// This initializer creates a
//	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
//	/// view on your behalf.
//	///
//	/// - Parameters:
//	///   - titleResource: A string resource that describes the contents of the menu.
//	///   - image: The image resource to lookup.
//	///   - content: A group of menu items.
//	///   - primaryAction: The action to perform on primary interaction with the menu.
//	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
//	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
//	@_disfavoredOverload
//	nonisolated init(
//		_ titleResource: LocalizedStringResource,
//		image: ImageResource,
//		@ViewBuilder content: () -> Content,
//		primaryAction: @escaping () -> Void
//	) {
//		self.init(String(localized: titleResource), image: image, content: content, primaryAction: primaryAction)
//	}

	// NOTE: For some reason, SwiftUI doesn't have a matching initializer that accepts `StringProtocol`.
//	/// Creates a menu with a primary action that generates its label from a string resource and system image.
//	///
//	/// This initializer creates a
//	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
//	/// view on your behalf.
//	///
//	/// - Parameters:
//	///   - titleResource: A string resource that describes the contents of the menu.
//	///   - systemImage: The image resource to lookup.
//	///   - content: A group of menu items.
//	///   - primaryAction: The action to perform on primary interaction with the menu.
//	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
//	@_disfavoredOverload
//	nonisolated init(
//		_ titleResource: LocalizedStringResource,
//		systemImage: String,
//		@ViewBuilder content: () -> Content,
//		primaryAction: @escaping () -> Void
//	) {
//		self.init(String(localized: titleResource), systemImage: systemImage, content: content, primaryAction: primaryAction)
//	}
}
#endif
