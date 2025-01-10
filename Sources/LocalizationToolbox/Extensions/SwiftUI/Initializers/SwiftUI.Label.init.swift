#if canImport(SwiftUI)
import SwiftUI

public extension Label where
	Title == Text,
	Icon == Image
{
	/// Creates a label with a system icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - titleResource: A string resource used as the label’s title.
	///   - name: The name of the image resource to lookup.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage name: String
	) {
		self.init(String(localized: titleResource), systemImage: name)
	}

	/// Creates a label with an icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - titleResource: A string resource used as the label’s title.
	///   - name: The name of the image resource to lookup.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image name: String
	) {
		self.init(String(localized: titleResource), image: name)
	}

	/// Creates a label with an icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - titleResource: A string resource used as the label’s title.
	///   - resource: The image resource to lookup.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image resource: ImageResource
	) {
		self.init(String(localized: titleResource), image: resource)
	}
}
#endif
