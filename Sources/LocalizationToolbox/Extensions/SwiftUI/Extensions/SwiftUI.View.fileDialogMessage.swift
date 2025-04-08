#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public extension View {
	/// On macOS, configures the
	/// [`fileExporter`]( https://developer.apple.com/documentation/swiftui/modal-presentations#Exporting-to-file ),
	/// [`fileImporter`]( https://developer.apple.com/documentation/swiftui/modal-presentations#Importing-from-file ), or
	/// [`fileMover`]( https://developer.apple.com/documentation/swiftui/modal-presentations#Moving-a-file )
	/// with a custom text that is presented to the user, similar to a title.
	///
	/// - Parameter messageResource: The string resource to use as the file dialog message.
	@inlinable
	nonisolated func fileDialogMessage(
		_ messageResource: LocalizedStringResource
	) -> some View {
		fileDialogMessage(Text(messageResource))
	}
}
#endif