import Foundation

// MARK: - BundleDescriptionResolvable

extension Bundle: BundleDescriptionResolvable {
	public func resolveBundleDescription() -> BundleDescription {
		BundleDescription(self)
	}
}

// MARK: - BundleResolvable

extension Bundle: BundleResolvable {
	public func resolveBundle() -> Bundle? {
		self
	}
}