#if canImport(SwiftUI)
import SwiftUI

public extension GroupBox where
	Label == Text,
	Content: View
{
	/// Creates a group box with the provided view content and a title generated from a string resource.
	///
	/// - Parameters:
	///   - title: A string resource that describes the content of the group box.
	///   - content: A
	///   [`ViewBuilder`]( https://developer.apple.com/documentation/swiftui/viewbuilder )
	///   that produces the content for the group box.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ title: LocalizedStringResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(String(localized: title), content: content)
	}
}
#endif