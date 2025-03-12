#if canImport(SwiftUI)
import SwiftUI

public extension View {
	/// Adds help text to a view using a string resource that you provide.
	///
	/// Adding help to a view configures the view’s accessibility hint and its help tag (also called a tooltip) in macOS or visionOS.
	/// For more information on using help tags, see
	/// [Offering help]( https://developer.apple.com/design/human-interface-guidelines/offering-help )
	/// in the Human Interface Guidelines.
	///
	/// - Parameters:
	///   - textResource: The string resource for the localized text to use as help.
	@available(iOS 14, macCatalyst 14, macOS 11, tvOS 14, watchOS 9, *)
	@inlinable
	nonisolated func help(
		_ textResource: LocalizedStringResource
	) -> some View {
		help(Text(textResource))
	}
}
#endif
