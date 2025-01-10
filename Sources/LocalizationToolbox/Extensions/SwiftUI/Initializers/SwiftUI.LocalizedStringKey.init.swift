#if canImport(SwiftUI)
import SwiftUI

public extension LocalizedStringKey {
	/// - Parameter resource:
	init(
		_ resource: borrowing LocalizedStringResource
	) {
		self.init(resource.key)
	}
}
#endif