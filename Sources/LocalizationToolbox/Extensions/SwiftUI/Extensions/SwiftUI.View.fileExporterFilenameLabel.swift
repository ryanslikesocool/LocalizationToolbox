#if canImport(SwiftUI)
import SwiftUI

@available(iOS 17.0, macOS 14.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public extension View {
	/// On macOS, configures the
	/// [`fileExporter`]( https://developer.apple.com/documentation/swiftui/modal-presentations#Exporting-to-file )
	/// with a text to use as a label for the file name field.
	///
	/// - Parameter labelResource: The string resource to use as the label for the file name field.
	@inlinable
	nonisolated func fileExporterFilenameLabel(
		_ labelResource: LocalizedStringResource
	) -> some View {
		fileExporterFilenameLabel(Text(labelResource))
	}
}
#endif
