#if canImport(SwiftUI)
import SwiftUI

public extension Label where
	Title == Text,
	Icon == Image
{
	/// Creates a label with a system icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - title: A string resource used as the label’s title.
	///   - name: The name of the image resource to lookup.
	nonisolated init(_ title: LocalizedStringResource, systemImage name: String) {
		self.init(String(localized: title), systemImage: name)
	}

	/// Creates a label with an icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - title: A string resource used as the label’s title.
	///   - name: The name of the image resource to lookup.
	nonisolated init(_ title: LocalizedStringResource, image name: String) {
		self.init(String(localized: title), image: name)
	}

	/// Creates a label with an icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - title: A string resource used as the label’s title.
	///   - resource: The image resource to lookup.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	nonisolated init(_ title: LocalizedStringResource, image resource: ImageResource) {
		self.init(String(localized: title), image: resource)
	}
}
#endif
