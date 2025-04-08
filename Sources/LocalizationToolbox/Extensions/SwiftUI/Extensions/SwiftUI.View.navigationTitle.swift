#if canImport(SwiftUI)
import SwiftUI

public extension View {
	/// Configures the view’s title for purposes of navigation, using a string resource.
	///
	/// A view’s navigation title is used to visually display the current navigation state of an interface.
	/// On iOS and watchOS, when a view is navigated to inside of a navigation view, that view’s title is displayed in the navigation bar.
	/// On iPadOS, the primary destination’s navigation title is reflected as the window’s title in the App Switcher.
	/// Similarly on macOS, the primary destination’s title is used as the window title in the titlebar, Windows menu and Mission Control.
	///
	/// Refer to the
	/// [Configure Your Apps Navigation Titles]( https://developer.apple.com/documentation/swiftui/configure-your-apps-navigation-titles )
	/// article for more information on navigation title modifiers.
	///
	/// - Parameters:
	///   - titleResource: The string resource to display.
	@inlinable
	nonisolated func navigationTitle(
		_ titleResource: LocalizedStringResource
	) -> some View {
		navigationTitle(Text(titleResource))
	}
}
#endif
