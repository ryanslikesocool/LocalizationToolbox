import Foundation

/// Describes an object that can be resolved into a
/// [`Bundle`]( https://developer.apple.com/documentation/foundation/bundle ).
public protocol BundleResolvable {
	/// Resolve the object into a
	/// [`Bundle`]( https://developer.apple.com/documentation/foundation/bundle ).
	func resolveBundle() -> Bundle?
}
