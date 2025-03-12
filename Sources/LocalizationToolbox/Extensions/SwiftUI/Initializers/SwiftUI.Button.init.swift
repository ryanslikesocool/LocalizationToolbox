#if canImport(SwiftUI)
import SwiftUI
#if canImport(AppIntents)
import AppIntents
#endif

// MARK: - where Label == Text

public extension Button where
	Label == Text
{
	/// Creates a button that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		action: @escaping @MainActor () -> Void
	) {
		self.init(action: action) {
			Label(titleResource)
		}
	}

	/// Creates a button with a specified role that generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		role: ButtonRole?,
		action: @escaping @MainActor () -> Void
	) {
		self.init(role: role, action: action) {
			Label(titleResource)
		}
	}

	// MARK: AppIntents

#if canImport(AppIntents)
	/// Creates a button that performs an `AppIntent` and generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `intent`.
	///   - intent: The `AppIntent` to execute.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		intent: some AppIntent
	) {
		self.init(intent: intent) {
			Label(titleResource)
		}
	}

	/// Creates a button with a specified role that performs an `AppIntent` and generates its label from a string resource.
	///
	/// This initializer creates a
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `intent`.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - intent: The `AppIntent` to execute.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		role: ButtonRole?,
		intent: some AppIntent
	) {
		self.init(role: role, intent: intent) {
			Label(titleResource)
		}
	}
#endif
}

// MARK: - where Label == SwiftUI.Label<Text, Image>

public extension Button where
	Label == SwiftUI.Label<Text, Image>
{
	/// Creates a button that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - image: The image resource to lookup.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		action: @escaping @MainActor () -> Void
	) {
		self.init(action: action) {
			Label(titleResource, image: image)
		}
	}

	/// Creates a button with a specified role that generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - image: The image resource to lookup.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, visionOS 1, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		role: ButtonRole?,
		action: @escaping @MainActor () -> Void
	) {
		self.init(role: role, action: action) {
			Label(titleResource, image: image)
		}
	}

	/// Creates a button that generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - systemImage: The name of the image resource to lookup.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		action: @escaping @MainActor () -> Void
	) {
		self.init(action: action) {
			Label(titleResource, systemImage: systemImage)
		}
	}

	/// Creates a button with a specified role that generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `action`.
	///   - systemImage: The name of the image resource to lookup.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - action: The action to perform when the user triggers the button.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		role: ButtonRole?,
		action: @escaping @MainActor () -> Void
	) {
		self.init(role: role, action: action) {
			Label(titleResource, systemImage: systemImage)
		}
	}

	// MARK: AppIntents

#if canImport(AppIntents)
	/// Creates a button that performs an `AppIntent` and generates its label from a string resource and image resource.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `intent`.
	///   - image: The image resource to lookup.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - intent: The `AppIntent` to execute.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		image: ImageResource,
		role: ButtonRole? = nil,
		intent: some AppIntent
	) {
		self.init(role: role, intent: intent) {
			Label(titleResource, image: image)
		}
	}

	/// Creates a button that performs an `AppIntent` and generates its label from a string resource and system image name.
	///
	/// This initializer creates a
	/// [`Label`]( https://developer.apple.com/documentation/swiftui/label )
	/// view on your behalf.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the purpose of the button’s `intent`.
	///   - systemImage: The name of the image resource to lookup.
	///   - role: An optional semantic role describing the button.
	///   A value of `nil` means that the button doesn’t have an assigned role.
	///   - intent: The `AppIntent` to execute.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@available(iOS 17, macCatalyst 17, macOS 14, tvOS 17, watchOS 10, *)
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		systemImage: String,
		role: ButtonRole? = nil,
		intent: some AppIntent
	) {
		self.init(role: role, intent: intent) {
			Label(titleResource, systemImage: systemImage)
		}
	}
#endif
}
#endif
