#if canImport(SwiftUI)
import SwiftUI

public extension NavigationLink where
	Label == Text,
	Destination: View
{
	/// Creates a navigation link that presents a destination view, with a text label that the link generates from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource for creating a text label.
	///   - destination: A view for the navigation link to present.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder destination: () -> Destination
	) {
		self.init(destination: destination) {
			Label(titleResource)
		}
	}
}

public extension NavigationLink where
	Label == Text,
	Destination == Never
{
	/// Creates a navigation link that presents the view corresponding to a codable value, with a text label that the link generates from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// When someone activates the navigation link that this initializer creates, SwiftUI looks for a nearby
	/// [`navigationDestination(for:destination:)`]( https://developer.apple.com/documentation/swiftui/view/navigationdestination(for:destination:) )
	/// view modifier with a data input parameter that matches the type of this initializer’s value input, with one of the following outcomes:
	/// - If SwiftUI finds a matching modifier within the view hierarchy of an enclosing
	/// [`NavigationStack`]( https://developer.apple.com/documentation/swiftui/navigationstack ),
	/// it pushes the modifier’s corresponding `destination` view onto the stack.
	/// - If SwiftUI finds a matching modifier in the view hierarchy of a stack that’s in a later column of a
	/// [`NavigationSplitView`]( https://developer.apple.com/documentation/swiftui/navigationsplitview ),
	/// it puts the modifier’s destination view as the first and only item onto the stack while preserving the stack’s root view.
	/// - If there’s no matching modifier, but the link appears in a
	/// [`List`]( https://developer.apple.com/documentation/swiftui/list )
	/// with selection inside a leading column of a navigation split view, the link updates the selection, which might affect the appearance of a trailing view.
	/// For an example of this, see
	/// [`NavigationLink`]( https://developer.apple.com/documentation/swiftui/navigationlink ).
	/// - In other cases, the link doesn’t do anything.
	///
	/// Because this initializer takes a value that conforms to the
	/// [`Codable`]( https://developer.apple.com/documentation/swift/codable )
	/// protocol, you ensure that a
	/// [`NavigationPath`]( https://developer.apple.com/documentation/swiftui/navigationpath )
	/// that includes this link can produce a non-`nil` value for its
	/// [`codable`]( https://developer.apple.com/documentation/swiftui/navigationpath/codable )
	/// property.
	/// This helps to make the path serializable.
	///
	/// - Parameters:
	///   - titleResource: A string resource for creating a text label.
	///   - value: An optional value to present.
	///   When someone taps or clicks the link, SwiftUI stores a copy of the value.
	///   Pass a `nil` value to disable the link.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<P>(
		_ titleResource: LocalizedStringResource,
		value: P?
	) where
		P: Decodable,
		P: Encodable,
		P: Hashable
	{
		self.init(value: value) {
			Label(titleResource)
		}
	}

	/// Creates a navigation link that presents the view corresponding to a value, with a text label that the link generates from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// When someone activates the navigation link that this initializer creates, SwiftUI looks for a nearby
	/// [`navigationDestination(for:destination:)`]( https://developer.apple.com/documentation/swiftui/view/navigationdestination(for:destination:) )
	/// view modifier with a data input parameter that matches the type of this initializer’s value input, with one of the following outcomes:
	/// - If SwiftUI finds a matching modifier within the view hierarchy of an enclosing
	/// [`NavigationStack`]( https://developer.apple.com/documentation/swiftui/navigationstack ),
	/// it pushes the modifier’s corresponding `destination` view onto the stack.
	/// - If SwiftUI finds a matching modifier in the view hierarchy of a stack that’s in a later column of a
	/// [`NavigationSplitView`]( https://developer.apple.com/documentation/swiftui/navigationsplitview ),
	/// it puts the modifier’s destination view as the first and only item onto the stack while preserving the stack’s root view.
	/// - If there’s no matching modifier, but the link appears in a
	/// [`List`]( https://developer.apple.com/documentation/swiftui/list )
	/// with selection inside a leading column of a navigation split view, the link updates the selection, which might affect the appearance of a trailing view.
	/// For an example of this, see
	/// [`NavigationLink`]( https://developer.apple.com/documentation/swiftui/navigationlink ).
	/// - In other cases, the link doesn’t do anything.
	///
	/// If you want to be able to serialize a
	/// [`NavigationPath`]( https://developer.apple.com/documentation/swiftui/navigationpath )
	/// that includes this link, use use a `value` that conforms to the
	/// [`Codable`]( https://developer.apple.com/documentation/swift/codable )
	/// protocol.
	///
	/// - Parameters:
	///   - titleResource: A string resource for creating a text label.
	///   - value: An optional value to present.
	///   When someone taps or clicks the link, SwiftUI stores a copy of the value.
	///   Pass a `nil` value to disable the link.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<P>(
		_ titleResource: LocalizedStringResource,
		value: P?
	) where
		P: Hashable
	{
		self.init(value: value) {
			Label(titleResource)
		}
	}
}
#endif
