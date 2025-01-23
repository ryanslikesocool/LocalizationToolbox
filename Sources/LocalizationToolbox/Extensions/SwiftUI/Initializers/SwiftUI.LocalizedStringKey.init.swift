#if canImport(SwiftUI)
import SwiftUI

public extension LocalizedStringKey {
	init(
		_ resource: borrowing LocalizedStringResource
	) {
		self.init(resource.key)
	}
}
#endif
