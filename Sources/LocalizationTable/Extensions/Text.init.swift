#if canImport(SwiftUI)
import SwiftUI

public extension Text {
	/// Creates a text view that displays localized content identified by a key.
	/// - Parameters:
	///   - key: The key for a string in the table identified by `table`.
	///   - table: <#table description#>
	///   - comment: Contextual information about this key-value pair.
	@inlinable @inline(__always)
	init(
		_ key: LocalizedStringKey,
		table: LocalizationTableResource,
		comment: StaticString? = nil
	) {
		self.init(key, tableName: table.name, bundle: table.bundle.bundle, comment: comment)
	}
}
#endif
