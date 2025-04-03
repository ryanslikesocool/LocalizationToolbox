#if canImport(SwiftUI)
import SwiftUI
#if SFSymbolToolbox
import SFSymbolToolbox
#endif

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
		self.init {
			Text(titleResource)
		} icon: {
			Image(systemName: name)
		}
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
		self.init {
			Text(titleResource)
		} icon: {
			Image(name)
		}
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
		self.init {
			Text(titleResource)
		} icon: {
			Image(resource)
		}
	}

	// MARK: SFSymbolToolbox

#if SFSymbolToolbox
	/// Creates a label with a system icon image and a title generated from a string resource.
	///
	/// - Parameters:
	///   - titleResource: A string resource used as the label’s title.
	///   - name: The name of the image resource to lookup.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage name: SystemSymbolName
	) {
		self.init {
			Text(titleResource)
		} icon: {
			Image(systemName: name)
		}
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
		image name: CustomSymbolName
	) {
		self.init {
			Text(titleResource)
		} icon: {
			Image(name)
		}
	}
#endif
}
#endif
