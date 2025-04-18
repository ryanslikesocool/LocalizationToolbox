#if canImport(SwiftUI)
import SwiftUI

public extension Section where
	Parent == Text,
	Content: View,
	Footer == EmptyView
{
	/// Creates a section with the provided section content.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the section.
	///   - content: The section’s content.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init(
		_ titleResource: LocalizedStringResource,
		@ViewBuilder content: () -> Content
	) {
		self.init(content: content) {
			Parent(titleResource)
		}
	}
}

public extension Section where
	Parent: TableRowContent,
	Content: TableRowContent,
	Footer: TableRowContent
{
	/// Creates a section with the provided section content.
	///
	/// - Parameters:
	///   - titleResource: A string resource that describes the contents of the section.
	///   - content: The section’s content.
	// NOTE: This initializer is disfavored over the initializer that receives `LocalizedStringKey`.
	@_disfavoredOverload
	nonisolated init<V>(
		_ titleResource: LocalizedStringResource,
		@TableRowBuilder<V> content: () -> Content
	) where
		Parent == TableHeaderRowContent<V, Text>,
		Footer == EmptyTableRowContent<V>,
		V == Content.TableRowValue
	{
		self.init(content: content) {
			Text(titleResource)
		}
	}
}
#endif
