#if canImport(SwiftUI)
import SwiftUI

public extension Text {
	@inlinable @inline(__always)
	init(
		_ key: LocalizedStringKey,
		table: LocalizationTable,
		comment: StaticString? = nil
	) {
		self.init(key, tableName: table.name, bundle: table.bundle, comment: comment)
	}
}
#endif
