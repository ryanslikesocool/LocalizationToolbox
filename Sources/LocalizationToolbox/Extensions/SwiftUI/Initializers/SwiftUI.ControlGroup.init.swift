#if canImport(SwiftUI)
import SwiftUI
#if SFSymbolToolbox
import SFSymbolToolbox
#endif

public extension ControlGroup where
	Content: View
{
	/// Creates a new control group with the specified content that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the group.
	///   - content: The content to display.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder content: () -> C
	) where
		Content == LabeledControlGroupContent<C, Text>,
		C: View
	{
		self.init(content: content) {
			Text(titleResource)
		}
	}

	/// Creates a new control group with the specified content that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the group.
	///   - image: The image resource to lookup.
	///   - content: The content to display.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		@ViewBuilder content: () -> C
	) where
		Content == LabeledControlGroupContent<C, Label<Text, Image>>,
		C: View
	{
		self.init(content: content) {
			Label(titleResource, image: image)
		}
	}

	/// Creates a new control group with the specified content that generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the group.
	///   - systemImage: The image resource to lookup.
	///   - content: The content to display.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 16, macCatalyst 16, macOS 13, tvOS 17, visionOS 1, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		@ViewBuilder content: () -> C
	) where
		Content == LabeledControlGroupContent<C, Label<Text, Image>>,
		C: View
	{
		self.init(content: content) {
			Label(titleResource, systemImage: systemImage)
		}
	}

	// MARK: SFSymbolToolbox

#if SFSymbolToolbox
	/// Creates a new control group with the specified content that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the group.
	///   - image: The image resource to lookup.
	///   - content: The content to display.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		image: CustomSymbolName,
		@ViewBuilder content: () -> C
	) where
		Content == LabeledControlGroupContent<C, Label<Text, Image>>,
		C: View
	{
		self.init(content: content) {
			Label(titleResource, image: image)
		}
	}

	/// Creates a new control group with the specified content that generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the group.
	///   - systemImage: The image resource to lookup.
	///   - content: The content to display.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 16, macCatalyst 16, macOS 13, tvOS 17, visionOS 1, *)
	@_disfavoredOverload
	nonisolated init<C>(
		_ titleResource: LocalizedStringResource,
		systemImage: SystemSymbolName,
		@ViewBuilder content: () -> C
	) where
		Content == LabeledControlGroupContent<C, Label<Text, Image>>,
		C: View
	{
		self.init(content: content) {
			Label(titleResource, systemImage: systemImage)
		}
	}
#endif
}
#endif
