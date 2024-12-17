import Foundation

/// Describes an object that can be resolved into a [`LocalizedStringResource.BundleDescription`](https://developer.apple.com/documentation/foundation/localizedstringresource/bundledescription) .
public protocol BundleDescriptionResolvable {
	/// Resolve the object into a [`LocalizedStringResource.BundleDescription`](https://developer.apple.com/documentation/foundation/localizedstringresource/bundledescription) .
	func resolveBundleDescription() -> BundleDescription
}
