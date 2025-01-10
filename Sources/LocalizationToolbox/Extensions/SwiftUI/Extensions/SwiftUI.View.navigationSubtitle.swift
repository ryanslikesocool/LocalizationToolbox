#if canImport(SwiftUI)
import SwiftUI

public extension View {
	/// Configures the view’s subtitle for purposes of navigation.
	///
	/// A view’s navigation subtitle is used to provide additional contextual information alongside the navigation title.
	/// On macOS, the primary destination’s subtitle is displayed with the navigation title in the titlebar.
	///
	/// - Parameters:
	///   - titleResource: The string resource to display.
	@available(macCatalyst 14, macOS 11, *)
	@available(iOS, unavailable)
	@available(tvOS, unavailable)
	@available(visionOS, unavailable)
	@available(watchOS, unavailable)
	nonisolated func navigationSubtitle(
		_ titleResource: LocalizedStringResource
	) -> some View {
		navigationSubtitle(String(localized: titleResource))
	}
}
#endif
