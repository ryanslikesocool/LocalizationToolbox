#if canImport(SwiftUI)
import SwiftUI

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
	///   - title: A string resource that describes the contents of the menu.
	///   - content: A group of menu items.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ title: LocalizedStringResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: title), content: content)
	}

	// NOTE: For some reason, SwiftUI doesn't have a matching initializer.
//	/// Creates a menu that generates its label from a string resource and system image.
//	///
//	/// This initializer creates a
//	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
//	/// view on your behalf.
//	///
//	/// - Parameters:
//	///   - title: A string resource that describes the contents of the menu.
//	///   - systemImage: The image resource to lookup.
//	///   - content: A group of menu items.
//	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
//	@_disfavoredOverload
//	nonisolated init(
//		_ title: LocalizedStringResource,
//		systemImage: String,
//		@ViewBuilder content: () -> Content
//	) {
//		self.init(String(localized: title), systemImage: systemImage, content: content)
//	}

	// NOTE: For some reason, SwiftUI doesn't have a matching initializer.
//	/// Creates a menu that generates its label from a string resource and image resource.
//	///
//	/// This initializer creates a
//	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
//	/// view on your behalf.
//	///
//	/// - Parameters:
//	///   - title: A string resource that describes the contents of the menu.
//	///   - image: The image resource to lookup.
//	///   - content: A group of menu items.
//	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
//	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
//	@_disfavoredOverload
//	nonisolated init(
//		_ title: LocalizedStringResource,
//		image: ImageResource,
//		@ViewBuilder content: () -> Content
//	) {
//		self.init(String(localized: title), image: image, content: content)
//	}
}

#endif