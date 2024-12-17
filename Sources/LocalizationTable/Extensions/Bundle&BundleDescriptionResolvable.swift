import Foundation

extension Bundle: BundleDescriptionResolvable {
	public func resolveBundleDescription() -> BundleDescription {
		BundleDescription(self)
	}
}
